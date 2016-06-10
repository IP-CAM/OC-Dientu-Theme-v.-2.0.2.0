<?php

class ModelCatalogSection extends Model {

    public function getSection($section_id) {
        $query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "section s LEFT JOIN " . DB_PREFIX . "section_description sd ON (s.section_id = sd.section_id) LEFT JOIN " . DB_PREFIX . "section_to_store s2s ON (s.section_id = s2s.section_id) WHERE s.section_id = '" . (int)$section_id . "' AND sd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND s2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND s.status = '1'");



        return $query->row;

    }
    public function getSection1($section_id) {

        $query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "section s LEFT JOIN " . DB_PREFIX . "section_description sd ON (s.section_id = sd.section_id) LEFT JOIN " . DB_PREFIX . "section_to_store s2s ON (s.section_id = s2s.section_id) WHERE s.section_id = '" . (int)$section_id . "' AND sd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND s.status = '1'");



        return $query->row;

    }


    public function getSections11($parent_id) {
        $sql = "SELECT * FROM " . DB_PREFIX . "section s LEFT JOIN " . DB_PREFIX . "section_description sd ON (s.section_id = sd.section_id) WHERE s.parent_id = '" . (int)$parent_id . "'";

        $query = $this->db->query($sql);

        return $query->rows;
    }

    public function getSections($parent_id = 0) {

        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "section s LEFT JOIN " . DB_PREFIX . "section_description sd ON (s.section_id = sd.section_id) LEFT JOIN " . DB_PREFIX . "section_to_store s2s ON (s.section_id = s2s.section_id) WHERE s.parent_id = '" . (int)$parent_id . "' AND sd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND s2s.store_id = '" . (int)$this->config->get('config_store_id') . "'  AND s.status = '1' ORDER BY s.sort_order, LCASE(sd.name)");



        return $query->rows;

    }



    public function getSectionsByParentId($section_id) {

        $section_data = array();



        $section_query = $this->db->query("SELECT section_id FROM " . DB_PREFIX . "section WHERE parent_id = '" . (int)$section_id . "'");



        foreach ($section_query->rows as $section) {

            $section_data[] = $section['section_id'];



            $children = $this->getSectionsByParentId($section['section_id']);



            if ($children) {

                $section_data = array_merge($children, $section_data);

            }

        }



        return $section_data;

    }



    public function getSectionLayoutId($section_id) {

        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "section_to_layout WHERE section_id = '" . (int)$section_id . "' AND store_id = '" . (int)$this->config->get('config_store_id') . "'");



        if ($query->num_rows) {

            return $query->row['layout_id'];

        } else {

            return $this->config->get('config_layout_section');

        }

    }



    public function getTotalSectionsBySectionId($parent_id = 0) {

        $query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "section s LEFT JOIN " . DB_PREFIX . "section_to_store s2s ON (s.section_id = s2s.section_id) WHERE s.parent_id = '" . (int)$parent_id . "' AND s2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND s.status = '1'");



        return $query->row['total'];

    }

}

?>