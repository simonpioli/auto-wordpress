#!/bin/sh
#
# 	Instant Wordpress!
# 	------------------
# 	My script for installing the latest version of WordPress plus a number of plugins I find useful.
#		
# 	To use this script, go to the directory you want to install Wordpress to in the terminal and run this command:
# 
# 	curl https://raw.github.com/simonpioli/auto-wordpress/master/auto-wordpress.sh | sh
#
# 	There you go.
#


# Latest version of WP
echo "Fetching WordPress...";
wget --quiet http://wordpress.org/latest.zip;
unzip -q latest.zip;

# Base Theme
echo "Which base theme? bones, underscore"
read theme
echo "What should we call it?"
read newname
if [[ "$theme" == "bones" ]]; then
	echo "Fetching Bones...";
	wget --quiet https://github.com/eddiemachado/bones/archive/master.zip;
	unzip -q bones-master.zip;
	mv bones-master wordpress/wp-content/themes/
	mv wordpress/wp-content/themes/bones-master wordpress/wp-content/themes/$newname
elif [[ "$theme" == "underscore" ]]; then
	echo "Fetching Underscore...";
	wget --quiet https://github.com/Automattic/_s/archive/master.zip;
	unzip -q _s-master.zip;
	mv _s-master wordpress/wp-content/themes/
	mv wordpress/wp-content/themes/_s-master wordpress/wp-content/themes/$newname
fi

# All-in-One-SEO-Pack
echo "Fetching All-in-One-SEO-Pack plugin...";
wget --quiet http://downloads.wordpress.org/plugin/all-in-one-seo-pack.zip;
unzip -q all-in-one-seo-pack.zip;
mv all-in-one-seo-pack wordpress/wp-content/plugins/

# Sitemap Generator
echo "Fetching Google Sitemap Generator plugin...";
wget --quiet http://downloads.wordpress.org/plugin/google-sitemap-generator.zip;	
unzip -q  google-sitemap-generator.zip;	
mv google-sitemap-generator wordpress/wp-content/plugins/

# Secure WordPress
echo "Fetching Secure WordPress plugin...";
wget --quiet http://downloads.wordpress.org/plugin/secure-wordpress.zip;
unzip -q  secure-wordpress.zip;
mv secure-wordpress wordpress/wp-content/plugins/

# Hierarchy Plugin
echo "Fetching Hierarchy plugin...";
wget --quiet http://downloads.wordpress.org/plugin/hierarchy.zip;
unzip -q  hierarchy.zip;
mv hierarchy wordpress/wp-content/plugins/

# Image Widgets (Why isn't this standard?)
echo "Fetching Image Widget plugin...";
wget --quiet http://downloads.wordpress.org/plugin/image-widget.zip;
unzip -q  image-widget.zip;
mv image-widget wordpress/wp-content/plugins/

# Super-cache
echo "Fetching Super Cache plugin...";
wget --quiet http://downloads.wordpress.org/plugin/wp-super-cache.zip;
unzip -q  wp-super-cache.zip;
mv wp-super-cache wordpress/wp-content/plugins/

# W3 Total Cache (A little redundant with above, but I like options.)
echo "Fetching W3 Total Cache...";
wget --quiet http://downloads.wordpress.org/plugin/w3-total-cache.zip
unzip -q  w3-total-cache.zip;
mv w3-total-cache wordpress/wp-content/plugins/

# Register Plus Redux (Good for membership-style sites)
echo "Fetching Register Plus Redux...";
wget --quiet http://downloads.wordpress.org/plugin/register-plus-redux.zip
unzip -q register-plus-redux.zip
mv register-plus-redux wordpress/wp-content/plugins/

# Regenerate Thumbnails (good for when you need to make custom sizes)
echo "Fetching Regenerate Thumbnails...";
wget --quiet http://downloads.wordpress.org/plugin/regenerate-thumbnails.zip
unzip -q regenerate-thumbnails.zip
mv regenerate-thumbnails wordpress/wp-content/plugins/

# Taxonomy Taxi
echo "Fetching Taxonomy Taxi...";
wget --quiet http://downloads.wordpress.org/plugin/taxonomy-taxi.zip
unzip -q taxonomy-taxi.zip
mv taxonomy-taxi wordpress/wp-content/plugins/

# Custom Post Type UI
echo "Fetching Custom Post Type UI...";
wget --quiet http://downloads.wordpress.org/plugin/custom-post-type-ui.zip
unzip -q custom-post-type-ui.zip
mv custom-post-type-ui wordpress/wp-content/plugins/

# WordPress Importer
echo "Fetching WordPress Importer...";
wget --quiet http://downloads.wordpress.org/plugin/wordpress-importer.zip
unzip -q wordpress-importer.zip
mv wordpress-importer wordpress/wp-content/plugins/

# WP-Quick-Pages
echo "Fetching WP-Quick-Pages...";
wget --quiet http://downloads.wordpress.org/plugin/wp-quick-pages.zip
unzip -q wp-quick-pages.zip
mv wp-quick-pages wordpress/wp-content/plugins/

# Simple Page Ordering
echo "Fetching Simple Page Ordering...";
wget --quiet http://downloads.wordpress.org/plugin/simple-page-ordering.zip
unzip -q simple-page-ordering.zip
mv simple-page-ordering wordpress/wp-content/plugins/

# FeedWordPress
echo "FeedWordPress...";
wget --quiet http://downloads.wordpress.org/plugin/feedwordpress.zip
unzip -q feedwordpress.zip
mv feedwordpress wordpress/wp-content/plugins/

# Cleanup
echo "Cleaning up temporary files and directories...";
rm *.zip

# Move stuff into current directory
mv wordpress/* .;
rm -rf wordpress;
echo "Done!";