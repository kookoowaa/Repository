## wkthmltopdf설치 및 path 설정 필요

import pdfkit
path_wkthmltopdf = r'C:\Program Files\wkhtmltopdf\bin\wkhtmltopdf.exe'
config = pdfkit.configuration(wkhtmltopdf=path_wkthmltopdf)

Vertical_option = {
    'orientation': 'Landscape'}
# options @ https://wkhtmltopdf.org/usage/wkhtmltopdf.txt

base_url = "http://ranking.uos.ac.kr/material/bigdata/week_4/web_scraping.html#"
url_list= []
for i in range(1,33):
    url_list.append(base_url+str(i))

pdfkit.from_url(url_list, "d:/Web Scraping.pdf", configuration=config, options = Vertical_option)
