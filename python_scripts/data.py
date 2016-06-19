__author__ = 'lavaraja'
import mysql.connector
from bs4 import BeautifulSoup
import urllib
import random

# database connection string
conn = mysql.connector.connect(host='localhost',
                                       database='BTSDB',
                                       user='appuser',
                                       password='appuser')


routeno='342Q'
distance=0
r = urllib.urlopen('http://narasimhadatta.info/cgi-bin/find.cgi?route=342Q').read()
soup = BeautifulSoup(r,"html.parser")
rec=soup.find_all('li')

for li in rec:
    conn1=conn.cursor()
    distance=distance+1
    test=li.text
    stmt="insert into busdet values('%s','%s',%d,%d)" %(routeno,li.text,distance,random.randint(1,10))
    print stmt
    conn1.execute(stmt)
    conn1.execute('commit')
    conn1.close()

