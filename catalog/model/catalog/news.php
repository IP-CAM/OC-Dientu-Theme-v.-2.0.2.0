<?php

class ModelCatalogNews extends Model {

    public function updateViewed($news_id) {

        $this->db->query("UPDATE " . DB_PREFIX . "news SET viewed = (viewed + 1) WHERE news_id = '" . (int)$news_id . "'");

    }



    public function getNews($news_id) {



        $query = $this->db->query("SELECT DISTINCT *, nd.title AS title, n.image, (SELECT AVG(rating) AS total FROM " . DB_PREFIX . "news_review r1 WHERE r1.news_id = n.news_id AND r1.status = '1' GROUP BY r1.news_id) AS rating, (SELECT COUNT(*) AS total FROM " . DB_PREFIX . "news_review r2 WHERE r2.news_id = n.news_id AND r2.status = '1' GROUP BY r2.news_id) AS reviews, n.sort_order FROM " . DB_PREFIX . "news n LEFT JOIN " . DB_PREFIX . "news_description nd ON (n.news_id = nd.news_id) LEFT JOIN " . DB_PREFIX . "news_to_store n2st ON (n.news_id = n2st.news_id) WHERE n.news_id = '" . (int)$news_id . "' AND nd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND n.status = '1' AND n2st.store_id = '" . (int)$this->config->get('config_store_id') . "'");



        if ($query->num_rows) {



            return $query->row;

        } else {

            return false;

        }

    }

    public function getBestNews($section_id, $limit) {
        $query = $this->db->query("SELECT DISTINCT *, nd.title AS title, n.image,
(SELECT AVG(rating) AS total FROM " . DB_PREFIX . "news_review r1 WHERE r1.news_id = n.news_id AND r1.status = '1' GROUP BY r1.news_id) AS rating,
(SELECT COUNT(*) AS total FROM " . DB_PREFIX . "news_review r2 WHERE r2.news_id = n.news_id AND r2.status = '1' GROUP BY r2.news_id) AS reviews, n.sort_order
FROM " . DB_PREFIX . "news n LEFT JOIN " . DB_PREFIX . "news_description nd ON (n.news_id = nd.news_id)
LEFT JOIN " . DB_PREFIX . "news_to_store n2st ON (n.news_id = n2st.news_id)
LEFT JOIN " . DB_PREFIX . "news_to_section nts ON (n.news_id = nts.news_id)
WHERE nts.section_id = '" . (int)$section_id. "' AND nd.language_id = '" . (int)$this->config->get('config_language_id') . "'
AND n.status = '1' AND n2st.store_id = '" . (int)$this->config->get('config_store_id') . "' ORDER BY n.date_added DESC LIMIT " . $limit);

//        echo '<pre>';
//        print_r($query->num_rows); exit;

        if ($query->num_rows) {



            return $query->rows;

        } else {

            return false;

        }

    }



    public function getNewss($data = array()) {



        $cache = md5(http_build_query($data));



        $news_data = $this->cache->get('news.' . (int)$this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id') . '.' . $cache);



        if (!$news_data) {

            $sql = "SELECT n.news_id, (SELECT AVG(rating) AS total FROM " . DB_PREFIX . "news_review r1 WHERE r1.news_id = n.news_id AND r1.status = '1' GROUP BY r1.news_id) AS rating  FROM " . DB_PREFIX . "news n LEFT JOIN " . DB_PREFIX . "news_description nd ON (n.news_id = nd.news_id) LEFT JOIN " . DB_PREFIX . "news_to_store n2st ON (n.news_id = n2st.news_id)";



            if (!empty($data['filter_tag'])) {

                $sql .= " LEFT JOIN " . DB_PREFIX . "news_tag nt ON (n.news_id = nt.news_id)";

            }



            if (!empty($data['filter_section_id'])) {

                $sql .= " LEFT JOIN " . DB_PREFIX . "news_to_section n2s ON (n.news_id = n2s.news_id)";

            }



            $sql .= " WHERE nd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND n.status = '1' AND n2st.store_id = '" . (int)$this->config->get('config_store_id') . "'";



            if (!empty($data['filter_title']) || !empty($data['filter_tag'])) {

                $sql .= " AND (";



                if (!empty($data['filter_title'])) {

                    $implode = array();



                    $words = explode(' ', $data['filter_title']);



                    foreach ($words as $word) {

                        if (!empty($data['filter_description'])) {

                            $implode[] = "LCASE(nd.title) LIKE '%" . $this->db->escape(utf8_strtolower($word)) . "%' OR LCASE(nd.description) LIKE '%" . $this->db->escape(utf8_strtolower($word)) . "%'";

                        } else {

                            $implode[] = "LCASE(nd.title) LIKE '%" . $this->db->escape(utf8_strtolower($word)) . "%'";

                        }

                    }



                    if ($implode) {

                        $sql .= " " . implode(" OR ", $implode) . "";

                    }

                }



                if (!empty($data['filter_title']) && !empty($data['filter_tag'])) {

                    $sql .= " OR ";

                }



                if (!empty($data['filter_tag'])) {

                    $implode = array();



                    $words = explode(' ', $data['filter_tag']);



                    foreach ($words as $word) {

                        $implode[] = "LCASE(nt.tag) LIKE '%" . $this->db->escape(utf8_strtolower($data['filter_tag'])) . "%' AND nt.language_id = '" . (int)$this->config->get('config_language_id') . "'";

                    }



                    if ($implode) {

                        $sql .= " " . implode(" OR ", $implode) . "";

                    }

                }



                $sql .= ")";

            }



            if (!empty($data['filter_section_id'])) {

                if (!empty($data['filter_sub_section'])) {

                    $implode_data = array();



                    $implode_data[] = "n2s.section_id = '" . (int)$data['filter_section_id'] . "'";



                    $this->load->model('catalog/section');



                    $sections = $this->model_catalog_section->getSectionsByParentId($data['filter_section_id']);



                    foreach ($sections as $section_id) {

                        $implode_data[] = "n2s.section_id = '" . (int)$section_id . "'";

                    }



                    $sql .= " AND (" . implode(' OR ', $implode_data) . ")";

                } else {

                    $sql .= " AND n2s.section_id = '" . (int)$data['filter_section_id'] . "'";

                }

            }



            $sql .= " GROUP BY n.news_id";



            $sort_data = array(

                'n.news_id',

                'nd.title',

                'n.sort_order',

                'n.date_added'

            );



            if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {

                if ($data['sort'] == 'nd.title' || $data['sort'] == 'n.model') {

                    $sql .= " ORDER BY LCASE(" . $data['sort'] . ")";

                } else {

                    $sql .= " ORDER BY " . $data['sort'];

                }

            } else {

                $sql .= " ORDER BY n.news_id";

            }



            if (isset($data['order']) && ($data['order'] == 'ASC')) {

                $sql .= " ASC";

            } else {

                $sql .= " DESC";

            }



            if (isset($data['start']) || isset($data['limit'])) {

                if ($data['start'] < 0) {

                    $data['start'] = 0;

                }



                if ($data['limit'] < 1) {

                    $data['limit'] = 20;

                }



                $sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];

            }



            $news_data = array();



            $query = $this->db->query($sql);



            foreach ($query->rows as $result) {

                $news_data[$result['news_id']] = $this->getNews($result['news_id']);

            }



            $this->cache->set('news.' . (int)$this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id') . '.' . $cache, $news_data);

        }



        return $news_data;

    }



    public function getLatestNewss($limit) {

        $news_data = $this->cache->get('news.latest.' . (int)$this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id') . '.' . (int)$limit);



        if (!$news_data) {

            $query = $this->db->query("SELECT n.news_id FROM " . DB_PREFIX . "news n LEFT JOIN " . DB_PREFIX . "news_to_store n2st ON (n.news_id = n2st.news_id) WHERE n.status = '1' AND n2st.store_id = '" . (int)$this->config->get('config_store_id') . "' ORDER BY n.date_added DESC LIMIT " . (int)$limit);



            foreach ($query->rows as $result) {

                $news_data[$result['news_id']] = $this->getNews($result['news_id']);

            }



            $this->cache->set('news.latest.' . (int)$this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id') . '.' . (int)$limit, $news_data);

        }



        return $news_data;

    }

    public function getLatestNewss1($limit) {

        $news_data = $this->cache->get('news.latest.' . (int)$this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id') . '.' . (int)$limit);



        if (!$news_data) {

            $query = $this->db->query("SELECT n.news_id FROM " . DB_PREFIX . "news n LEFT JOIN " . DB_PREFIX . "news_to_store n2st ON (n.news_id = n2st.news_id) WHERE n.status = '1' AND n2st.store_id = '" . (int)$this->config->get('config_store_id') . "' AND  ORDER BY n.date_added DESC LIMIT " . (int)$limit);



            foreach ($query->rows as $result) {

                $news_data[$result['news_id']] = $this->getNews($result['news_id']);

            }



            $this->cache->set('news.latest.' . (int)$this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id') . '.' . (int)$limit, $news_data);

        }



        return $news_data;

    }



    public function getPopularNewss($limit) {

        $news_data = array();



        $query = $this->db->query("SELECT n.news_id FROM " . DB_PREFIX . "news n LEFT JOIN " . DB_PREFIX . "news_to_store n2st ON (n.news_id = n2st.news_id) WHERE n.status = '1'  AND n2st.store_id = '" . (int)$this->config->get('config_store_id') . "' ORDER BY n.viewed, n.date_added DESC LIMIT " . (int)$limit);



        foreach ($query->rows as $result) {

            $news_data[$result['news_id']] = $this->getNews($result['news_id']);

        }



        return $news_data;

    }



    public function getNewsTags($news_id) {
//        $sql = "SELECT * FROM " . DB_PREFIX . "news_tag WHERE news_id = '" . (int)$news_id . "' AND language_id = '" . (int)$this->config->get('config_language_id') . "'";
//        echo $sql; exit;
        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "news_tag WHERE news_id = '" . (int)$news_id . "' AND language_id = '" . (int)$this->config->get('config_language_id') . "'");



        return $query->rows;

    }



    public function getNewsLayoutId($news_id) {

        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "news_to_layout WHERE news_id = '" . (int)$news_id . "' AND store_id = '" . (int)$this->config->get('config_store_id') . "'");



        if ($query->num_rows) {

            return $query->row['layout_id'];

        } else {

            return  $this->config->get('config_layout_news');

        }

    }


    public function getSections1($data) {
        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "section_description");

        return $query->rows;
    }
    public function getSections($news_id) {

        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "news_to_section WHERE news_id = '" . (int)$news_id . "'");



        return $query->rows;

    }



    public function getTotalNewss($data = array()) {

        $sql = "SELECT COUNT(DISTINCT n.news_id) AS total FROM " . DB_PREFIX . "news n LEFT JOIN " . DB_PREFIX . "news_description nd ON (n.news_id = nd.news_id) LEFT JOIN " . DB_PREFIX . "news_to_store n2st ON (n.news_id = n2st.news_id)";



        if (!empty($data['filter_section_id'])) {

            $sql .= " LEFT JOIN " . DB_PREFIX . "news_to_section n2s ON (n.news_id = n2s.news_id)";

        }



        if (!empty($data['filter_tag'])) {

            $sql .= " LEFT JOIN " . DB_PREFIX . "news_tag nt ON (n.news_id = nt.news_id)";

        }



        $sql .= " WHERE nd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND n.status = '1' AND n2st.store_id = '" . (int)$this->config->get('config_store_id') . "'";



        if (!empty($data['filter_title']) || !empty($data['filter_tag'])) {

            $sql .= " AND (";



            if (!empty($data['filter_title'])) {

                $implode = array();



                $words = explode(' ', $data['filter_title']);



                foreach ($words as $word) {

                    if (!empty($data['filter_description'])) {

                        $implode[] = "LCASE(nd.title) LIKE '%" . $this->db->escape(utf8_strtolower($word)) . "%' OR LCASE(nd.description) LIKE '%" . $this->db->escape(utf8_strtolower($word)) . "%'";

                    } else {

                        $implode[] = "LCASE(nd.title) LIKE '%" . $this->db->escape(utf8_strtolower($word)) . "%'";

                    }

                }



                if ($implode) {

                    $sql .= " " . implode(" OR ", $implode) . "";

                }

            }



            if (!empty($data['filter_title']) && !empty($data['filter_tag'])) {

                $sql .= " OR ";

            }



            if (!empty($data['filter_tag'])) {

                $implode = array();



                $words = explode(' ', $data['filter_tag']);



                foreach ($words as $word) {

                    $implode[] = "LCASE(nt.tag) LIKE '%" . $this->db->escape(utf8_strtolower($data['filter_tag'])) . "%' AND nt.language_id = '" . (int)$this->config->get('config_language_id') . "'";

                }



                if ($implode) {

                    $sql .= " " . implode(" OR ", $implode) . "";

                }

            }



            $sql .= ")";

        }



        if (!empty($data['filter_section_id'])) {

            if (!empty($data['filter_sub_section'])) {

                $implode_data = array();



                $implode_data[] = "n2s.section_id = '" . (int)$data['filter_section_id'] . "'";



                $this->load->model('catalog/section');



                $sections = $this->model_catalog_section->getSectionsByParentId($data['filter_section_id']);



                foreach ($sections as $section_id) {

                    $implode_data[] = "n2s.section_id = '" . (int)$section_id . "'";

                }



                $sql .= " AND (" . implode(' OR ', $implode_data) . ")";

            } else {

                $sql .= " AND n2s.section_id = '" . (int)$data['filter_section_id'] . "'";

            }

        }



        $query = $this->db->query($sql);



        return $query->row['total'];

    }

}

?>