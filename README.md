# Ruby Lab

This is my get-to-know Ruby and Rails project. This projects is comprised of:

1. A webservice:
    1. POST /phish
    1. GET /phishes?page_size=20&page=100
1. A Phishtank ETL for their XML Feed:
    1. Extracts the XML feed
    1. Parses the XML and transforms to JSON, to POST to /phish
    1. POSTs to /phish


https://www.phishtank.com/developer_info.php

http://data.phishtank.com/data/online-valid.xml

```xml
<output>
    <meta>
        <total_entries>1234</total_entries>
    </meta>
    <entries>
        <entry>
            <url><![CDATA[https://www.example.com/]]></url>
            <phish_id>123456</phish_id>
            <phish_detail_url>http://www.phishtank.com/phish_detail.php?phish_id=123456</phish_detail_url>
            <details>
                <detail>
                    <ip_address>1.2.3.4</ip_address>
                    <cidr_block>1.2.3.0/24</ip_address>
                    <announcing_network>1234</announcing_network>
                    <rir>arin</rir>
                    <detail_time>2009-06-20T15:37:31+00:00</detail_time>
                </detail>
            </details>
            <submission>
                <submission_time>2009-06-19T15:15:47+00:00</submission_time>
            </submission>
            <verification>
                <verified>yes</verified>
                <verification_time>2009-06-19T15:37:31+00:00</verification_time>
            </verification>
            <status>
                <online>yes</online>
            </status>
            <target>1st National Example Bank</target>
        </entry>
        ...
    </entries>
</output>
```
