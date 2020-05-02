BUCKET_NAME=www.globalirrigationmap.org
aws s3 sync _site/ s3://${BUCKET_NAME}/ --recursive
for file in *.html ; do
	bare_file=`basename $file .html`
	if [ "$bare_file" != "index" ] ; then
		aws s3 mv s3://${BUCKET_NAME}/$file s3://${BUCKET_NAME}/$bare_file
	fi
done

