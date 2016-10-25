FROM enoniccloud/enonic-cms
# If Enonic CMS 4.5 or earlier, use "FROM enoniccloud/enonic-cms-jdk6" as JDK7 support was added in Enonic CMS 4.7

# Make sure unzip is available in the image:
RUN apt-get update && apt-get install -y unzip

# Set timezone to Europe/Oslo
RUN echo "Europe/Oslo" > /etc/timezone && dpkg-reconfigure -f noninteractive tzdata

RUN wget -O webapps/ROOT.war http://repo.enonic.com/enterprise/com/enonic/cms/cms-ee-webapp/4.7.15/cms-ee-webapp-4.7.15.war

COPY cms.home $CMS_HOME

