#!/bin/bash

# Latest version of WP
echo "Fetching WordPress...";
curl -O https://wordpress.org/latest.zip;
unzip -q latest.zip;

# Base Theme
echo "Which base theme? 'bones', 'underscore' or 'none' if you don't want a base theme."
read theme

if [ $theme != "none" ]; then
	echo "What should we call the theme?"
	read newname

	if [ $theme == "bones" ]; then
		echo "Fetching Bones...";
		# curl -L -o $newname.zip https://github.com/repos/eddiemachado/bones/zipball/master
		curl -L -o $newname.tar.gz https://api.github.com/repos/eddiemachado/bones/tarball;
		tar -zxvf $newname.tar.gz;
		mv *bones* wordpress/wp-content/themes/
		mv wordpress/wp-content/themes/*bones* wordpress/wp-content/themes/$newname
	elif [ $theme == "underscore" ]; then
		echo "Fetching Underscore...";
		curl -L -o newname.tar.gz https://api.github.com/repos/Automattic/_s/tarball;
		tar -zxvf $newname.tar.gz;
		mv *_s* wordpress/wp-content/themes/
		mv wordpress/wp-content/themes/*_s* wordpress/wp-content/themes/$newname
	fi
fi

# All-in-One-SEO-Pack
echo "Fetching All-in-One-SEO-Pack plugin...";
curl -O http://downloads.wordpress.org/plugin/all-in-one-seo-pack.zip;
unzip -q all-in-one-seo-pack.zip;
mv all-in-one-seo-pack wordpress/wp-content/plugins/

# Sitemap Generator
echo "Fetching Google Sitemap Generator plugin...";
curl -O http://downloads.wordpress.org/plugin/google-sitemap-generator.zip;	
unzip -q  google-sitemap-generator.zip;	
mv google-sitemap-generator wordpress/wp-content/plugins/

# Secure WordPress
echo "Fetching Secure WordPress plugin...";
curl -O http://downloads.wordpress.org/plugin/secure-wordpress.zip;
unzip -q  secure-wordpress.zip;
mv secure-wordpress wordpress/wp-content/plugins/

# Hierarchy Plugin
# echo "Fetching Hierarchy plugin...";
# curl -O http://downloads.wordpress.org/plugin/hierarchy.zip;
# unzip -q  hierarchy.zip;
# mv hierarchy wordpress/wp-content/plugins/

# Image Widgets (Why isn't this standard?)
# echo "Fetching Image Widget plugin...";
# curl -O http://downloads.wordpress.org/plugin/image-widget.zip;
# unzip -q  image-widget.zip;
# mv image-widget wordpress/wp-content/plugins/

# Super-cache
echo "Fetching Super Cache plugin...";
curl -O http://downloads.wordpress.org/plugin/wp-super-cache.zip;
unzip -q  wp-super-cache.zip;
mv wp-super-cache wordpress/wp-content/plugins/

# W3 Total Cache (A little redundant with above, but I like options.)
echo "Fetching W3 Total Cache...";
curl -O http://downloads.wordpress.org/plugin/w3-total-cache.zip
unzip -q  w3-total-cache.zip;
mv w3-total-cache wordpress/wp-content/plugins/

# Register Plus Redux (Good for membership-style sites)
echo "Fetching Register Plus Redux...";
curl -O http://downloads.wordpress.org/plugin/register-plus-redux.zip
unzip -q register-plus-redux.zip
mv register-plus-redux wordpress/wp-content/plugins/

# Regenerate Thumbnails (good for when you need to make custom sizes)
echo "Fetching Regenerate Thumbnails...";
curl -O http://downloads.wordpress.org/plugin/regenerate-thumbnails.zip
unzip -q regenerate-thumbnails.zip
mv regenerate-thumbnails wordpress/wp-content/plugins/

# Taxonomy Taxi
echo "Fetching Taxonomy Taxi...";
curl -O http://downloads.wordpress.org/plugin/taxonomy-taxi.zip
unzip -q taxonomy-taxi.zip
mv taxonomy-taxi wordpress/wp-content/plugins/

# Custom Post Type UI
# echo "Fetching Custom Post Type UI...";
# curl -O http://downloads.wordpress.org/plugin/custom-post-type-ui.zip
# unzip -q custom-post-type-ui.zip
# mv custom-post-type-ui wordpress/wp-content/plugins/

# Advanced Custom Fields
echo "Fetching Advanced Custom Fields...";
curl -O http://downloads.wordpress.org/plugin/advanced-custom-fields.zip
unzip -q advanced-custom-fields.zip
mv advanced-custom-fields wordpress/wp-content/plugins/

# WordPress Importer
echo "Fetching WordPress Importer...";
curl -O http://downloads.wordpress.org/plugin/wordpress-importer.zip
unzip -q wordpress-importer.zip
mv wordpress-importer wordpress/wp-content/plugins/

# WP-Quick-Pages
# echo "Fetching WP-Quick-Pages...";
# curl -O http://downloads.wordpress.org/plugin/wp-quick-pages.zip
# unzip -q wp-quick-pages.zip
# mv wp-quick-pages wordpress/wp-content/plugins/

# Simple Page Ordering
echo "Fetching Simple Page Ordering...";
curl -O http://downloads.wordpress.org/plugin/simple-page-ordering.zip
unzip -q simple-page-ordering.zip
mv simple-page-ordering wordpress/wp-content/plugins/

# FeedWordPress
echo "FeedWordPress...";
curl -O http://downloads.wordpress.org/plugin/feedwordpress.zip
unzip -q feedwordpress.zip
mv feedwordpress wordpress/wp-content/plugins/

# Cleanup
echo "Cleaning up temporary files and directories...";
rm *.zip
rm *.tar.gz

# Move stuff into current directory
mv wordpress/* .;
rm -rf wordpress;
echo "Done!";
