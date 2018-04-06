FROM profideo/php54-apache-node

# Install and enable xdebug
RUN pecl install xdebug-2.4.1
RUN echo "\n; configuration for php XDebug module\n; priority=20\nzend_extension=$(command find '/usr/local/lib/php/' '/usr/lib/php5/' -name 'xdebug.so' | command head -n 1)\nxdebug.max_nesting_level=1000" | tee -a /usr/local/etc/php/php.ini

# Install for import EXCEL
RUN pear install OLE-1.0.0RC3
