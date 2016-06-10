<?php echo $header; ?>
<div class="container">
    <div class="row"><?php echo $column_left; ?>
        <?php if ($column_left && $column_right) { ?>
        <?php $class = 'col-sm-6'; ?>
        <?php } elseif ($column_left || $column_right) { ?>
        <?php $class = 'col-sm-9'; ?>
        <?php } else { ?>
        <?php $class = 'col-sm-12'; ?>
        <?php } ?>
        <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
            <div class="col-md-12 titletintuc">
            <h3><?php echo $heading_title; ?></h3>
            </div>
            <div class="section-content col-md-12 col-sm-12 mtv pn">
                <div class="section">
                    <div class="col-sm-12 col-lg-12 col-md-12 tintuctuvan pn">
               <!--  <?php if ($review_status) { ?>
                <div class="review">
                    <div class="share-out">
                        <div class="share">
                            <img src="catalog/view/theme/default/image/stars-<?php echo $rating; ?>.png" alt="<?php echo $reviews; ?>" align="left" />
                            Place this tag where you want the +1 button to render
                            <g:plusone size="small" annotation="none"></g:plusone>
                            Place this render call where appropriate
                            <a href="javascript:void(0)" title="Facebook" onclick="fbs_click()"><img border="0" src="image/social/share_facebook_20.png" height="18" /></a>
                            <a href="javascript:void(0)" title="Youtube" onclick="youtube_click()"><img border="0" src="image/social/youtube.jpg" height="18" width="18"/></a>
                            <a href="javascript:void(0)" title="Google" onclick="google_click()"><img border="0" src="image/social/share_google_20.png" height="18"/></a>
                            <a href="javascript:void(0)" title="Pinterest" onclick="pinterest_click()"><img border="0" src="image/social/layer.jpg" height="18" width="18"/></a>
                        </div>
                    </div>
                    <?php } ?> -->
                        <?php echo $description; ?>
                    </div>
                    </div>
                    </div>
                </div>
            </div>
<!--     <div class="row">
        <div class="tag">
            <?php if ($tags) { ?>
            <p>
                <?php for ($i = 0; $i < count($tags); $i++) { ?>
                <?php if ($i < (count($tags) - 1)) { ?>
                <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>
                <?php } else { ?>
                <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>
                <?php } ?>
                <?php } ?>
            </p>
            <?php } ?>
        </div>
    </div> -->
    <?php echo $content_bottom; ?>
</div>
<script type="text/javascript">
    function GetMetaValue(meta_name) {
        var my_arr=document.getElementsByTagName("META");
        for (var counter=0; counter<my_arr.length; counter++) {
            if (my_arr[counter].name.toLowerCase() == meta_name.toLowerCase()) {
                return my_arr[counter].content;
            }
        }
        return "N/A";
    }
</script>
<script type="text/javascript">
    function fbs_click() {u=location.href;t=document.title;window.open('http://www.facebook.com/sharer.php?u='+encodeURIComponent(u)+'&t='+encodeURIComponent(t),'sharer','toolbar=0,status=0,width=626,height=436');return false;}
    function youtube_click() {u=location.href;t=document.title;window.open('http://www.youtube.com');return false;}
    function pinterest_click() {u=location.href;t=document.title;window.open('https://www.pinterest.com/');return false;}
    function twitter_click(){u=location.href;t=document.title;window.open('http://twitter.com/share/?url='+encodeURIComponent(u)+'&text='+encodeURIComponent(t),'sharer','toolbar=0,status=0,width=626,height=436');return false;}
    function linkedin_click(){u=location.href;t=document.title;window.open('http://www.linkedin.com/shareArticle?url='+encodeURIComponent(u)+'&title='+encodeURIComponent(t),'sharer','toolbar=0,status=0,width=626,height=436');return false;}
    function wordpress_click(){u=location.href;t=document.title;window.open('http://so1vnforum.wordpress.com/wp-admin/press-this.php?u='+encodeURIComponent(u)+'&t='+encodeURIComponent(t)+'&s='+GetMetaValue('description')+'&v='+2,'sharer','toolbar=0,status=0,width=626,height=436');return false;}
    function tumblr_click() {u=location.href;t=document.title;window.open('http://www.tumblr.com/share/link?url='+encodeURIComponent(u)+'&name='+t+'&description='+GetMetaValue('description'),'sharer','toolbar=0,status=0,width=626,height=436');return false;}
    function myspace_click() {u=location.href;t=document.title;window.open('http://www.myspace.com/index.cfm?fuseaction=postto&t='+encodeURIComponent(t)+'&c='+GetMetaValue('description')+'&u='+encodeURIComponent(u),'sharer','toolbar=0,status=0,width=626,height=436');return false;}
    function stumbleupon_click() {u=location.href;t=document.title;window.open('http://www.stumbleupon.com/submit?url='+encodeURIComponent(u)+'&title='+t,'sharer','toolbar=0,status=0,width=626,height=436');return false;}
    function delicious_click() {u=location.href;t=document.title;window.open('http://delicious.com/post?url='+encodeURIComponent(u)+'&title='+t+'&notes='+GetMetaValue('description'),'sharer','toolbar=0,status=0,width=626,height=436');return false;}
    function digg_click() {u=location.href;t=document.title;window.open('http://digg.com/submit?url='+encodeURIComponent(u)+'&title='+encodeURIComponent(t),'sharer','toolbar=0,status=0,width=626,height=436');return false;}
    function reddit_click() {u=location.href;t=document.title;window.open('http://www.reddit.com/submit?url='+encodeURIComponent(u)+'&title='+encodeURIComponent(t),'sharer','toolbar=0,status=0,width=626,height=436');return false;}
    function messenger_click() {u=location.href;t=document.title;window.open('http://profile.live.com/P.mvc#!/badge?url='+encodeURIComponent(u)+'&title='+encodeURIComponent(t)+'&description='+GetMetaValue('description'),'sharer','toolbar=0,status=0,width=626,height=436');return false;}
    function google_click() {u=location.href;t=document.title;window.open('http://www.google.com/bookmarks/mark?op=edit&bkmk='+encodeURIComponent(u)+'&title='+t+'&annotation='+GetMetaValue('description'),'sharer','toolbar=0,status=0,width=626,height=436');return false;}
    function blogger_click(){u=location.href;t=document.title;window.open('http://www.blogger.com/blog_this.pyra?t=&u='+encodeURIComponent(u)+'&n='+encodeURIComponent(t)+'&pli='+1,'sharer','toolbar=0,status=0,width=626,height=436');return false;}
    function googlereader_click() {u=location.href;t=document.title;window.open('http://www.google.com/reader/link?url='+encodeURIComponent(u)+'&title='+t+'&snippet='+GetMetaValue('description'),'sharer','toolbar=0,status=0,width=626,height=436');return false;}
    function linkhay_click() {u=location.href;t=document.title;window.open('http://linkhay.com/submit?link_url='+encodeURIComponent(u)+'&link_title='+t,'sharer','toolbar=0,status=0,width=626,height=436');return false;}
    function zingme_click() {u=location.href;t=document.title;window.open('http://link.apps.zing.vn/pro/view/conn/share?u='+encodeURIComponent(u)+'&t='+t+'&desc='+GetMetaValue('description'),'sharer','toolbar=0,status=0,width=626,height=436');return false;}
    //function govn_click() {u=location.href;t=document.title;window.open('http://my.go.vn/share.aspx?url='+encodeURIComponent(u)+'&title='+encodeURIComponent(t),'sharer','toolbar=0,status=0,width=626,height=436');return false;}
    function yahoo_click() {u=location.href;t=document.title;window.open('http://buzz.yahoo.com/buzz?publisherurn=VNE&targetUrl='+encodeURIComponent(u),'sharer','toolbar=0,status=0,width=626,height=436');return false;}
</script>
<?php echo $footer; ?>