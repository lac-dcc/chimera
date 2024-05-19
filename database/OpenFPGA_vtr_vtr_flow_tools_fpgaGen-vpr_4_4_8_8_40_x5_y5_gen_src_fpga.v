// This program was cloned from: https://github.com/haojunliu/OpenFPGA
// License: BSD 2-Clause "Simplified" License

module fpga(
    input [39:0] top_in,
    input [39:0] bot_in,
    input [39:0] left_in,
    input [39:0] right_in,
    output [39:0] top_out,
    output [39:0] bot_out,
    output [39:0] left_out,
    output [39:0] right_out,
    input [223:0] configs_in,
    input [42:0] configs_en,
    input ff_en, clock, rst
);

    // Interconnection Wire Declaration
    wire wire_25;
    wire wire_28;
    wire wire_31;
    wire wire_34;
    wire wire_37;
    wire wire_40;
    wire wire_43;
    wire wire_46;
    wire wire_73;
    wire wire_76;
    wire wire_79;
    wire wire_82;
    wire wire_85;
    wire wire_88;
    wire wire_91;
    wire wire_94;
    wire wire_121;
    wire wire_124;
    wire wire_127;
    wire wire_130;
    wire wire_133;
    wire wire_136;
    wire wire_139;
    wire wire_142;
    wire wire_169;
    wire wire_172;
    wire wire_175;
    wire wire_178;
    wire wire_181;
    wire wire_184;
    wire wire_187;
    wire wire_190;
    wire wire_217;
    wire wire_220;
    wire wire_223;
    wire wire_226;
    wire wire_229;
    wire wire_232;
    wire wire_235;
    wire wire_238;
    wire wire_265;
    wire wire_268;
    wire wire_271;
    wire wire_274;
    wire wire_277;
    wire wire_280;
    wire wire_283;
    wire wire_286;
    wire wire_305;
    wire wire_306;
    wire wire_307;
    wire wire_308;
    wire wire_327;
    wire wire_328;
    wire wire_329;
    wire wire_330;
    wire wire_349;
    wire wire_350;
    wire wire_351;
    wire wire_352;
    wire wire_371;
    wire wire_372;
    wire wire_373;
    wire wire_374;
    wire wire_393;
    wire wire_394;
    wire wire_395;
    wire wire_396;
    wire wire_423;
    wire wire_426;
    wire wire_429;
    wire wire_432;
    wire wire_435;
    wire wire_438;
    wire wire_441;
    wire wire_444;
    wire wire_471;
    wire wire_474;
    wire wire_477;
    wire wire_480;
    wire wire_483;
    wire wire_486;
    wire wire_489;
    wire wire_492;
    wire wire_511;
    wire wire_512;
    wire wire_513;
    wire wire_514;
    wire wire_533;
    wire wire_534;
    wire wire_535;
    wire wire_536;
    wire wire_555;
    wire wire_556;
    wire wire_557;
    wire wire_558;
    wire wire_577;
    wire wire_578;
    wire wire_579;
    wire wire_580;
    wire wire_599;
    wire wire_600;
    wire wire_601;
    wire wire_602;
    wire wire_629;
    wire wire_632;
    wire wire_635;
    wire wire_638;
    wire wire_641;
    wire wire_644;
    wire wire_647;
    wire wire_650;
    wire wire_677;
    wire wire_680;
    wire wire_683;
    wire wire_686;
    wire wire_689;
    wire wire_692;
    wire wire_695;
    wire wire_698;
    wire wire_717;
    wire wire_718;
    wire wire_719;
    wire wire_720;
    wire wire_739;
    wire wire_740;
    wire wire_741;
    wire wire_742;
    wire wire_761;
    wire wire_762;
    wire wire_763;
    wire wire_764;
    wire wire_783;
    wire wire_784;
    wire wire_785;
    wire wire_786;
    wire wire_805;
    wire wire_806;
    wire wire_807;
    wire wire_808;
    wire wire_835;
    wire wire_838;
    wire wire_841;
    wire wire_844;
    wire wire_847;
    wire wire_850;
    wire wire_853;
    wire wire_856;
    wire wire_883;
    wire wire_886;
    wire wire_889;
    wire wire_892;
    wire wire_895;
    wire wire_898;
    wire wire_901;
    wire wire_904;
    wire wire_923;
    wire wire_924;
    wire wire_925;
    wire wire_926;
    wire wire_945;
    wire wire_946;
    wire wire_947;
    wire wire_948;
    wire wire_967;
    wire wire_968;
    wire wire_969;
    wire wire_970;
    wire wire_989;
    wire wire_990;
    wire wire_991;
    wire wire_992;
    wire wire_1011;
    wire wire_1012;
    wire wire_1013;
    wire wire_1014;
    wire wire_1041;
    wire wire_1044;
    wire wire_1047;
    wire wire_1050;
    wire wire_1053;
    wire wire_1056;
    wire wire_1059;
    wire wire_1062;
    wire wire_1089;
    wire wire_1092;
    wire wire_1095;
    wire wire_1098;
    wire wire_1101;
    wire wire_1104;
    wire wire_1107;
    wire wire_1110;
    wire wire_1129;
    wire wire_1130;
    wire wire_1131;
    wire wire_1132;
    wire wire_1151;
    wire wire_1152;
    wire wire_1153;
    wire wire_1154;
    wire wire_1173;
    wire wire_1174;
    wire wire_1175;
    wire wire_1176;
    wire wire_1195;
    wire wire_1196;
    wire wire_1197;
    wire wire_1198;
    wire wire_1217;
    wire wire_1218;
    wire wire_1219;
    wire wire_1220;
    wire wire_1247;
    wire wire_1250;
    wire wire_1253;
    wire wire_1256;
    wire wire_1259;
    wire wire_1262;
    wire wire_1265;
    wire wire_1268;
    wire wire_1295;
    wire wire_1298;
    wire wire_1301;
    wire wire_1304;
    wire wire_1307;
    wire wire_1310;
    wire wire_1313;
    wire wire_1316;
    wire wire_1343;
    wire wire_1346;
    wire wire_1349;
    wire wire_1352;
    wire wire_1355;
    wire wire_1358;
    wire wire_1361;
    wire wire_1364;
    wire wire_1391;
    wire wire_1394;
    wire wire_1397;
    wire wire_1400;
    wire wire_1403;
    wire wire_1406;
    wire wire_1409;
    wire wire_1412;
    wire wire_1439;
    wire wire_1442;
    wire wire_1445;
    wire wire_1448;
    wire wire_1451;
    wire wire_1454;
    wire wire_1457;
    wire wire_1460;
    wire wire_1487;
    wire wire_1490;
    wire wire_1493;
    wire wire_1496;
    wire wire_1499;
    wire wire_1502;
    wire wire_1505;
    wire wire_1508;
    wire wire_1510;
    wire wire_1511;
    wire wire_1512;
    wire wire_1513;
    wire wire_1514;
    wire wire_1515;
    wire wire_1516;
    wire wire_1517;
    wire wire_1518;
    wire wire_1519;
    wire wire_1520;
    wire wire_1521;
    wire wire_1522;
    wire wire_1523;
    wire wire_1524;
    wire wire_1525;
    wire wire_1526;
    wire wire_1527;
    wire wire_1528;
    wire wire_1529;
    wire wire_1530;
    wire wire_1531;
    wire wire_1532;
    wire wire_1533;
    wire wire_1534;
    wire wire_1535;
    wire wire_1536;
    wire wire_1537;
    wire wire_1538;
    wire wire_1539;
    wire wire_1540;
    wire wire_1541;
    wire wire_1542;
    wire wire_1543;
    wire wire_1544;
    wire wire_1545;
    wire wire_1546;
    wire wire_1547;
    wire wire_1548;
    wire wire_1549;
    wire wire_1550;
    wire wire_1551;
    wire wire_1552;
    wire wire_1553;
    wire wire_1554;
    wire wire_1555;
    wire wire_1556;
    wire wire_1557;
    wire wire_1558;
    wire wire_1559;
    wire wire_1560;
    wire wire_1561;
    wire wire_1562;
    wire wire_1563;
    wire wire_1564;
    wire wire_1565;
    wire wire_1566;
    wire wire_1567;
    wire wire_1568;
    wire wire_1569;
    wire wire_1570;
    wire wire_1571;
    wire wire_1572;
    wire wire_1573;
    wire wire_1574;
    wire wire_1575;
    wire wire_1576;
    wire wire_1577;
    wire wire_1578;
    wire wire_1579;
    wire wire_1580;
    wire wire_1581;
    wire wire_1582;
    wire wire_1583;
    wire wire_1584;
    wire wire_1585;
    wire wire_1586;
    wire wire_1587;
    wire wire_1588;
    wire wire_1589;
    wire wire_1590;
    wire wire_1591;
    wire wire_1592;
    wire wire_1593;
    wire wire_1594;
    wire wire_1595;
    wire wire_1596;
    wire wire_1597;
    wire wire_1598;
    wire wire_1599;
    wire wire_1600;
    wire wire_1601;
    wire wire_1602;
    wire wire_1603;
    wire wire_1604;
    wire wire_1605;
    wire wire_1606;
    wire wire_1607;
    wire wire_1608;
    wire wire_1609;
    wire wire_1610;
    wire wire_1611;
    wire wire_1612;
    wire wire_1613;
    wire wire_1614;
    wire wire_1615;
    wire wire_1616;
    wire wire_1617;
    wire wire_1618;
    wire wire_1619;
    wire wire_1620;
    wire wire_1621;
    wire wire_1622;
    wire wire_1623;
    wire wire_1624;
    wire wire_1625;
    wire wire_1626;
    wire wire_1627;
    wire wire_1628;
    wire wire_1629;
    wire wire_1630;
    wire wire_1631;
    wire wire_1632;
    wire wire_1633;
    wire wire_1634;
    wire wire_1635;
    wire wire_1636;
    wire wire_1637;
    wire wire_1638;
    wire wire_1639;
    wire wire_1640;
    wire wire_1641;
    wire wire_1642;
    wire wire_1643;
    wire wire_1644;
    wire wire_1645;
    wire wire_1646;
    wire wire_1647;
    wire wire_1648;
    wire wire_1649;
    wire wire_1650;
    wire wire_1651;
    wire wire_1652;
    wire wire_1653;
    wire wire_1654;
    wire wire_1655;
    wire wire_1656;
    wire wire_1657;
    wire wire_1658;
    wire wire_1659;
    wire wire_1660;
    wire wire_1661;
    wire wire_1662;
    wire wire_1663;
    wire wire_1664;
    wire wire_1665;
    wire wire_1666;
    wire wire_1667;
    wire wire_1668;
    wire wire_1669;
    wire wire_1670;
    wire wire_1671;
    wire wire_1672;
    wire wire_1673;
    wire wire_1674;
    wire wire_1675;
    wire wire_1676;
    wire wire_1677;
    wire wire_1678;
    wire wire_1679;
    wire wire_1680;
    wire wire_1681;
    wire wire_1682;
    wire wire_1683;
    wire wire_1684;
    wire wire_1685;
    wire wire_1686;
    wire wire_1687;
    wire wire_1688;
    wire wire_1689;
    wire wire_1690;
    wire wire_1691;
    wire wire_1692;
    wire wire_1693;
    wire wire_1694;
    wire wire_1695;
    wire wire_1696;
    wire wire_1697;
    wire wire_1698;
    wire wire_1699;
    wire wire_1700;
    wire wire_1701;
    wire wire_1702;
    wire wire_1703;
    wire wire_1704;
    wire wire_1705;
    wire wire_1706;
    wire wire_1707;
    wire wire_1708;
    wire wire_1709;
    wire wire_1710;
    wire wire_1711;
    wire wire_1712;
    wire wire_1713;
    wire wire_1714;
    wire wire_1715;
    wire wire_1716;
    wire wire_1717;
    wire wire_1718;
    wire wire_1719;
    wire wire_1720;
    wire wire_1721;
    wire wire_1722;
    wire wire_1723;
    wire wire_1724;
    wire wire_1725;
    wire wire_1726;
    wire wire_1727;
    wire wire_1728;
    wire wire_1729;
    wire wire_1730;
    wire wire_1731;
    wire wire_1732;
    wire wire_1733;
    wire wire_1734;
    wire wire_1735;
    wire wire_1736;
    wire wire_1737;
    wire wire_1738;
    wire wire_1739;
    wire wire_1740;
    wire wire_1741;
    wire wire_1742;
    wire wire_1743;
    wire wire_1744;
    wire wire_1745;
    wire wire_1746;
    wire wire_1747;
    wire wire_1748;
    wire wire_1749;
    wire wire_1750;
    wire wire_1751;
    wire wire_1752;
    wire wire_1753;
    wire wire_1754;
    wire wire_1755;
    wire wire_1756;
    wire wire_1757;
    wire wire_1758;
    wire wire_1759;
    wire wire_1760;
    wire wire_1761;
    wire wire_1762;
    wire wire_1763;
    wire wire_1764;
    wire wire_1765;
    wire wire_1766;
    wire wire_1767;
    wire wire_1768;
    wire wire_1769;
    wire wire_1770;
    wire wire_1771;
    wire wire_1772;
    wire wire_1773;
    wire wire_1774;
    wire wire_1775;
    wire wire_1776;
    wire wire_1777;
    wire wire_1778;
    wire wire_1779;
    wire wire_1780;
    wire wire_1781;
    wire wire_1782;
    wire wire_1783;
    wire wire_1784;
    wire wire_1785;
    wire wire_1786;
    wire wire_1787;
    wire wire_1788;
    wire wire_1789;
    wire wire_1790;
    wire wire_1791;
    wire wire_1792;
    wire wire_1793;
    wire wire_1794;
    wire wire_1795;
    wire wire_1796;
    wire wire_1797;
    wire wire_1798;
    wire wire_1799;
    wire wire_1800;
    wire wire_1801;
    wire wire_1802;
    wire wire_1803;
    wire wire_1804;
    wire wire_1805;
    wire wire_1806;
    wire wire_1807;
    wire wire_1808;
    wire wire_1809;
    wire wire_1810;
    wire wire_1811;
    wire wire_1812;
    wire wire_1813;
    wire wire_1814;
    wire wire_1815;
    wire wire_1816;
    wire wire_1817;
    wire wire_1818;
    wire wire_1819;
    wire wire_1820;
    wire wire_1821;
    wire wire_1822;
    wire wire_1823;
    wire wire_1824;
    wire wire_1825;
    wire wire_1826;
    wire wire_1827;
    wire wire_1828;
    wire wire_1829;
    wire wire_1830;
    wire wire_1831;
    wire wire_1832;
    wire wire_1833;
    wire wire_1834;
    wire wire_1835;
    wire wire_1836;
    wire wire_1837;
    wire wire_1838;
    wire wire_1839;
    wire wire_1840;
    wire wire_1841;
    wire wire_1842;
    wire wire_1843;
    wire wire_1844;
    wire wire_1845;
    wire wire_1846;
    wire wire_1847;
    wire wire_1848;
    wire wire_1849;
    wire wire_1850;
    wire wire_1851;
    wire wire_1852;
    wire wire_1853;
    wire wire_1854;
    wire wire_1855;
    wire wire_1856;
    wire wire_1857;
    wire wire_1858;
    wire wire_1859;
    wire wire_1860;
    wire wire_1861;
    wire wire_1862;
    wire wire_1863;
    wire wire_1864;
    wire wire_1865;
    wire wire_1866;
    wire wire_1867;
    wire wire_1868;
    wire wire_1869;
    wire wire_1870;
    wire wire_1871;
    wire wire_1872;
    wire wire_1873;
    wire wire_1874;
    wire wire_1875;
    wire wire_1876;
    wire wire_1877;
    wire wire_1878;
    wire wire_1879;
    wire wire_1880;
    wire wire_1881;
    wire wire_1882;
    wire wire_1883;
    wire wire_1884;
    wire wire_1885;
    wire wire_1886;
    wire wire_1887;
    wire wire_1888;
    wire wire_1889;
    wire wire_1890;
    wire wire_1891;
    wire wire_1892;
    wire wire_1893;
    wire wire_1894;
    wire wire_1895;
    wire wire_1896;
    wire wire_1897;
    wire wire_1898;
    wire wire_1899;
    wire wire_1900;
    wire wire_1901;
    wire wire_1902;
    wire wire_1903;
    wire wire_1904;
    wire wire_1905;
    wire wire_1906;
    wire wire_1907;
    wire wire_1908;
    wire wire_1909;
    wire wire_1910;
    wire wire_1911;
    wire wire_1912;
    wire wire_1913;
    wire wire_1914;
    wire wire_1915;
    wire wire_1916;
    wire wire_1917;
    wire wire_1918;
    wire wire_1919;
    wire wire_1920;
    wire wire_1921;
    wire wire_1922;
    wire wire_1923;
    wire wire_1924;
    wire wire_1925;
    wire wire_1926;
    wire wire_1927;
    wire wire_1928;
    wire wire_1929;
    wire wire_1930;
    wire wire_1931;
    wire wire_1932;
    wire wire_1933;
    wire wire_1934;
    wire wire_1935;
    wire wire_1936;
    wire wire_1937;
    wire wire_1938;
    wire wire_1939;
    wire wire_1940;
    wire wire_1941;
    wire wire_1942;
    wire wire_1943;
    wire wire_1944;
    wire wire_1945;
    wire wire_1946;
    wire wire_1947;
    wire wire_1948;
    wire wire_1949;
    wire wire_1950;
    wire wire_1951;
    wire wire_1952;
    wire wire_1953;
    wire wire_1954;
    wire wire_1955;
    wire wire_1956;
    wire wire_1957;
    wire wire_1958;
    wire wire_1959;
    wire wire_1960;
    wire wire_1961;
    wire wire_1962;
    wire wire_1963;
    wire wire_1964;
    wire wire_1965;
    wire wire_1966;
    wire wire_1967;
    wire wire_1968;
    wire wire_1969;
    wire wire_1970;
    wire wire_1971;
    wire wire_1972;
    wire wire_1973;
    wire wire_1974;
    wire wire_1975;
    wire wire_1976;
    wire wire_1977;
    wire wire_1978;
    wire wire_1979;
    wire wire_1980;
    wire wire_1981;
    wire wire_1982;
    wire wire_1983;
    wire wire_1984;
    wire wire_1985;
    wire wire_1986;
    wire wire_1987;
    wire wire_1988;
    wire wire_1989;
    wire wire_1990;
    wire wire_1991;
    wire wire_1992;
    wire wire_1993;
    wire wire_1994;
    wire wire_1995;
    wire wire_1996;
    wire wire_1997;
    wire wire_1998;
    wire wire_1999;
    wire wire_2000;
    wire wire_2001;
    wire wire_2002;
    wire wire_2003;
    wire wire_2004;
    wire wire_2005;
    wire wire_2006;
    wire wire_2007;
    wire wire_2008;
    wire wire_2009;
    wire wire_2010;
    wire wire_2011;
    wire wire_2012;
    wire wire_2013;
    wire wire_2014;
    wire wire_2015;
    wire wire_2016;
    wire wire_2017;
    wire wire_2018;
    wire wire_2019;
    wire wire_2020;
    wire wire_2021;
    wire wire_2022;
    wire wire_2023;
    wire wire_2024;
    wire wire_2025;
    wire wire_2026;
    wire wire_2027;
    wire wire_2028;
    wire wire_2029;
    wire wire_2030;
    wire wire_2031;
    wire wire_2032;
    wire wire_2033;
    wire wire_2034;
    wire wire_2035;
    wire wire_2036;
    wire wire_2037;
    wire wire_2038;
    wire wire_2039;
    wire wire_2040;
    wire wire_2041;
    wire wire_2042;
    wire wire_2043;
    wire wire_2044;
    wire wire_2045;
    wire wire_2046;
    wire wire_2047;
    wire wire_2048;
    wire wire_2049;
    wire wire_2050;
    wire wire_2051;
    wire wire_2052;
    wire wire_2053;
    wire wire_2054;
    wire wire_2055;
    wire wire_2056;
    wire wire_2057;
    wire wire_2058;
    wire wire_2059;
    wire wire_2060;
    wire wire_2061;
    wire wire_2062;
    wire wire_2063;
    wire wire_2064;
    wire wire_2065;
    wire wire_2066;
    wire wire_2067;
    wire wire_2068;
    wire wire_2069;
    wire wire_2070;
    wire wire_2071;
    wire wire_2072;
    wire wire_2073;
    wire wire_2074;
    wire wire_2075;
    wire wire_2076;
    wire wire_2077;
    wire wire_2078;
    wire wire_2079;
    wire wire_2080;
    wire wire_2081;
    wire wire_2082;
    wire wire_2083;
    wire wire_2084;
    wire wire_2085;
    wire wire_2086;
    wire wire_2087;
    wire wire_2088;
    wire wire_2089;
    wire wire_2090;
    wire wire_2091;
    wire wire_2092;
    wire wire_2093;
    wire wire_2094;
    wire wire_2095;
    wire wire_2096;
    wire wire_2097;
    wire wire_2098;
    wire wire_2099;
    wire wire_2100;
    wire wire_2101;
    wire wire_2102;
    wire wire_2103;
    wire wire_2104;
    wire wire_2105;
    wire wire_2106;
    wire wire_2107;
    wire wire_2108;
    wire wire_2109;
    wire wire_2110;
    wire wire_2111;
    wire wire_2112;
    wire wire_2113;
    wire wire_2114;
    wire wire_2115;
    wire wire_2116;
    wire wire_2117;
    wire wire_2118;
    wire wire_2119;
    wire wire_2120;
    wire wire_2121;
    wire wire_2122;
    wire wire_2123;
    wire wire_2124;
    wire wire_2125;
    wire wire_2126;
    wire wire_2127;
    wire wire_2128;
    wire wire_2129;
    wire wire_2130;
    wire wire_2131;
    wire wire_2132;
    wire wire_2133;
    wire wire_2134;
    wire wire_2135;
    wire wire_2136;
    wire wire_2137;
    wire wire_2138;
    wire wire_2139;
    wire wire_2140;
    wire wire_2141;
    wire wire_2142;
    wire wire_2143;
    wire wire_2144;
    wire wire_2145;
    wire wire_2146;
    wire wire_2147;
    wire wire_2148;
    wire wire_2149;
    wire wire_2150;
    wire wire_2151;
    wire wire_2152;
    wire wire_2153;
    wire wire_2154;
    wire wire_2155;
    wire wire_2156;
    wire wire_2157;
    wire wire_2158;
    wire wire_2159;
    wire wire_2160;
    wire wire_2161;
    wire wire_2162;
    wire wire_2163;
    wire wire_2164;
    wire wire_2165;
    wire wire_2166;
    wire wire_2167;
    wire wire_2168;
    wire wire_2169;
    wire wire_2170;
    wire wire_2171;
    wire wire_2172;
    wire wire_2173;
    wire wire_2174;
    wire wire_2175;
    wire wire_2176;
    wire wire_2177;
    wire wire_2178;
    wire wire_2179;
    wire wire_2180;
    wire wire_2181;
    wire wire_2182;
    wire wire_2183;
    wire wire_2184;
    wire wire_2185;
    wire wire_2186;
    wire wire_2187;
    wire wire_2188;
    wire wire_2189;
    wire wire_2190;
    wire wire_2191;
    wire wire_2192;
    wire wire_2193;
    wire wire_2194;
    wire wire_2195;
    wire wire_2196;
    wire wire_2197;
    wire wire_2198;
    wire wire_2199;
    wire wire_2200;
    wire wire_2201;
    wire wire_2202;
    wire wire_2203;
    wire wire_2204;
    wire wire_2205;
    wire wire_2206;
    wire wire_2207;
    wire wire_2208;
    wire wire_2209;
    wire wire_2210;
    wire wire_2211;
    wire wire_2212;
    wire wire_2213;
    wire wire_2214;
    wire wire_2215;
    wire wire_2216;
    wire wire_2217;
    wire wire_2218;
    wire wire_2219;
    wire wire_2220;
    wire wire_2221;
    wire wire_2222;
    wire wire_2223;
    wire wire_2224;
    wire wire_2225;
    wire wire_2226;
    wire wire_2227;
    wire wire_2228;
    wire wire_2229;
    wire wire_2230;
    wire wire_2231;
    wire wire_2232;
    wire wire_2233;
    wire wire_2234;
    wire wire_2235;
    wire wire_2236;
    wire wire_2237;
    wire wire_2238;
    wire wire_2239;
    wire wire_2240;
    wire wire_2241;
    wire wire_2242;
    wire wire_2243;
    wire wire_2244;
    wire wire_2245;
    wire wire_2246;
    wire wire_2247;
    wire wire_2248;
    wire wire_2249;
    wire wire_2250;
    wire wire_2251;
    wire wire_2252;
    wire wire_2253;
    wire wire_2254;
    wire wire_2255;
    wire wire_2256;
    wire wire_2257;
    wire wire_2258;
    wire wire_2259;
    wire wire_2260;
    wire wire_2261;
    wire wire_2262;
    wire wire_2263;
    wire wire_2264;
    wire wire_2265;
    wire wire_2266;
    wire wire_2267;
    wire wire_2268;
    wire wire_2269;
    wire wire_2270;
    wire wire_2271;
    wire wire_2272;
    wire wire_2273;
    wire wire_2274;
    wire wire_2275;
    wire wire_2276;
    wire wire_2277;
    wire wire_2278;
    wire wire_2279;
    wire wire_2280;
    wire wire_2281;
    wire wire_2282;
    wire wire_2283;
    wire wire_2284;
    wire wire_2285;
    wire wire_2286;
    wire wire_2287;
    wire wire_2288;
    wire wire_2289;
    wire wire_2290;
    wire wire_2291;
    wire wire_2292;
    wire wire_2293;
    wire wire_2294;
    wire wire_2295;
    wire wire_2296;
    wire wire_2297;
    wire wire_2298;
    wire wire_2299;
    wire wire_2300;
    wire wire_2301;
    wire wire_2302;
    wire wire_2303;
    wire wire_2304;
    wire wire_2305;
    wire wire_2306;
    wire wire_2307;
    wire wire_2308;
    wire wire_2309;
    wire wire_2310;
    wire wire_2311;
    wire wire_2312;
    wire wire_2313;
    wire wire_2314;
    wire wire_2315;
    wire wire_2316;
    wire wire_2317;
    wire wire_2318;
    wire wire_2319;
    wire wire_2320;
    wire wire_2321;
    wire wire_2322;
    wire wire_2323;
    wire wire_2324;
    wire wire_2325;
    wire wire_2326;
    wire wire_2327;
    wire wire_2328;
    wire wire_2329;
    wire wire_2330;
    wire wire_2331;
    wire wire_2332;
    wire wire_2333;
    wire wire_2334;
    wire wire_2335;
    wire wire_2336;
    wire wire_2337;
    wire wire_2338;
    wire wire_2339;
    wire wire_2340;
    wire wire_2341;
    wire wire_2342;
    wire wire_2343;
    wire wire_2344;
    wire wire_2345;
    wire wire_2346;
    wire wire_2347;
    wire wire_2348;
    wire wire_2349;
    wire wire_2350;
    wire wire_2351;
    wire wire_2352;
    wire wire_2353;
    wire wire_2354;
    wire wire_2355;
    wire wire_2356;
    wire wire_2357;
    wire wire_2358;
    wire wire_2359;
    wire wire_2360;
    wire wire_2361;
    wire wire_2362;
    wire wire_2363;
    wire wire_2364;
    wire wire_2365;
    wire wire_2366;
    wire wire_2367;
    wire wire_2368;
    wire wire_2369;
    wire wire_2370;
    wire wire_2371;
    wire wire_2372;
    wire wire_2373;
    wire wire_2374;
    wire wire_2375;
    wire wire_2376;
    wire wire_2377;
    wire wire_2378;
    wire wire_2379;
    wire wire_2380;
    wire wire_2381;
    wire wire_2382;
    wire wire_2383;
    wire wire_2384;
    wire wire_2385;
    wire wire_2386;
    wire wire_2387;
    wire wire_2388;
    wire wire_2389;
    wire wire_2390;
    wire wire_2391;
    wire wire_2392;
    wire wire_2393;
    wire wire_2394;
    wire wire_2395;
    wire wire_2396;
    wire wire_2397;
    wire wire_2398;
    wire wire_2399;
    wire wire_2400;
    wire wire_2401;
    wire wire_2402;
    wire wire_2403;
    wire wire_2404;
    wire wire_2405;
    wire wire_2406;
    wire wire_2407;
    wire wire_2408;
    wire wire_2409;
    wire wire_2410;
    wire wire_2411;
    wire wire_2412;
    wire wire_2413;
    wire wire_2414;
    wire wire_2415;
    wire wire_2416;
    wire wire_2417;
    wire wire_2418;
    wire wire_2419;
    wire wire_2420;
    wire wire_2421;
    wire wire_2422;
    wire wire_2423;
    wire wire_2424;
    wire wire_2425;
    wire wire_2426;
    wire wire_2427;
    wire wire_2428;
    wire wire_2429;
    wire wire_2430;
    wire wire_2431;
    wire wire_2432;
    wire wire_2433;
    wire wire_2434;
    wire wire_2435;
    wire wire_2436;
    wire wire_2437;
    wire wire_2438;
    wire wire_2439;
    wire wire_2440;
    wire wire_2441;
    wire wire_2442;
    wire wire_2443;
    wire wire_2444;
    wire wire_2445;
    wire wire_2446;
    wire wire_2447;
    wire wire_2448;
    wire wire_2449;
    wire wire_2450;
    wire wire_2451;
    wire wire_2452;
    wire wire_2453;
    wire wire_2454;
    wire wire_2455;
    wire wire_2456;
    wire wire_2457;
    wire wire_2458;
    wire wire_2459;
    wire wire_2460;
    wire wire_2461;
    wire wire_2462;
    wire wire_2463;
    wire wire_2464;
    wire wire_2465;
    wire wire_2466;
    wire wire_2467;
    wire wire_2468;
    wire wire_2469;


    // FPGA IO TILES DECLARE
    wire [80:0] io_tile_1_0_chanxy_in;
    wire [24:0] io_tile_1_0_chanxy_out;
    wire [31:0] io_tile_1_0_ipin_in;
    wire [7:0] io_tile_1_0_opin_out;
    io_tile_sp_0 io_tile_1_0(
            .io_chanxy_in(io_tile_1_0_chanxy_in),
            .io_chanxy_out(io_tile_1_0_chanxy_out),
            .io_configs_in(configs_in[31:0]),
            .io_configs_en(configs_en[3:2]),
            .io_io_input(left_in[7:0]),
            .io_io_output(left_out[7:0]),
            .io_ipin_in(io_tile_1_0_ipin_in),
            .io_opin_out(io_tile_1_0_opin_out),
            .io_x_loc(),
            .io_y_loc(),
            .clk(clock),
            .reset(rst)
        );

    wire [85:0] io_tile_2_0_chanxy_in;
    wire [9:0] io_tile_2_0_chanxy_out;
    wire [31:0] io_tile_2_0_ipin_in;
    wire [7:0] io_tile_2_0_opin_out;
    io_tile_sp_1 io_tile_2_0(
            .io_chanxy_in(io_tile_2_0_chanxy_in),
            .io_chanxy_out(io_tile_2_0_chanxy_out),
            .io_configs_in(configs_in[31:0]),
            .io_configs_en(configs_en[11:10]),
            .io_io_input(left_in[15:8]),
            .io_io_output(left_out[15:8]),
            .io_ipin_in(io_tile_2_0_ipin_in),
            .io_opin_out(io_tile_2_0_opin_out),
            .io_x_loc(),
            .io_y_loc(),
            .clk(clock),
            .reset(rst)
        );

    wire [85:0] io_tile_3_0_chanxy_in;
    wire [9:0] io_tile_3_0_chanxy_out;
    wire [31:0] io_tile_3_0_ipin_in;
    wire [7:0] io_tile_3_0_opin_out;
    io_tile_sp_2 io_tile_3_0(
            .io_chanxy_in(io_tile_3_0_chanxy_in),
            .io_chanxy_out(io_tile_3_0_chanxy_out),
            .io_configs_in(configs_in[31:0]),
            .io_configs_en(configs_en[19:18]),
            .io_io_input(left_in[23:16]),
            .io_io_output(left_out[23:16]),
            .io_ipin_in(io_tile_3_0_ipin_in),
            .io_opin_out(io_tile_3_0_opin_out),
            .io_x_loc(),
            .io_y_loc(),
            .clk(clock),
            .reset(rst)
        );

    wire [85:0] io_tile_4_0_chanxy_in;
    wire [9:0] io_tile_4_0_chanxy_out;
    wire [31:0] io_tile_4_0_ipin_in;
    wire [7:0] io_tile_4_0_opin_out;
    io_tile_sp_3 io_tile_4_0(
            .io_chanxy_in(io_tile_4_0_chanxy_in),
            .io_chanxy_out(io_tile_4_0_chanxy_out),
            .io_configs_in(configs_in[31:0]),
            .io_configs_en(configs_en[27:26]),
            .io_io_input(left_in[31:24]),
            .io_io_output(left_out[31:24]),
            .io_ipin_in(io_tile_4_0_ipin_in),
            .io_opin_out(io_tile_4_0_opin_out),
            .io_x_loc(),
            .io_y_loc(),
            .clk(clock),
            .reset(rst)
        );

    wire [80:0] io_tile_5_0_chanxy_in;
    wire [24:0] io_tile_5_0_chanxy_out;
    wire [31:0] io_tile_5_0_ipin_in;
    wire [7:0] io_tile_5_0_opin_out;
    io_tile_sp_4 io_tile_5_0(
            .io_chanxy_in(io_tile_5_0_chanxy_in),
            .io_chanxy_out(io_tile_5_0_chanxy_out),
            .io_configs_in(configs_in[31:0]),
            .io_configs_en(configs_en[35:34]),
            .io_io_input(left_in[39:32]),
            .io_io_output(left_out[39:32]),
            .io_ipin_in(io_tile_5_0_ipin_in),
            .io_opin_out(io_tile_5_0_opin_out),
            .io_x_loc(),
            .io_y_loc(),
            .clk(clock),
            .reset(rst)
        );

    wire [31:0] io_tile_1_6_ipin_in;
    wire [7:0] io_tile_1_6_opin_out;
    io_tile_sp_5 io_tile_1_6(
            .io_configs_in(configs_in[223:192]),
            .io_configs_en(configs_en[2:2]),
            .io_io_input(right_in[7:0]),
            .io_io_output(right_out[7:0]),
            .io_ipin_in(io_tile_1_6_ipin_in),
            .io_opin_out(io_tile_1_6_opin_out),
            .io_x_loc(),
            .io_y_loc(),
            .clk(clock),
            .reset(rst)
        );

    wire [31:0] io_tile_2_6_ipin_in;
    wire [7:0] io_tile_2_6_opin_out;
    io_tile_sp_6 io_tile_2_6(
            .io_configs_in(configs_in[223:192]),
            .io_configs_en(configs_en[10:10]),
            .io_io_input(right_in[15:8]),
            .io_io_output(right_out[15:8]),
            .io_ipin_in(io_tile_2_6_ipin_in),
            .io_opin_out(io_tile_2_6_opin_out),
            .io_x_loc(),
            .io_y_loc(),
            .clk(clock),
            .reset(rst)
        );

    wire [31:0] io_tile_3_6_ipin_in;
    wire [7:0] io_tile_3_6_opin_out;
    io_tile_sp_7 io_tile_3_6(
            .io_configs_in(configs_in[223:192]),
            .io_configs_en(configs_en[18:18]),
            .io_io_input(right_in[23:16]),
            .io_io_output(right_out[23:16]),
            .io_ipin_in(io_tile_3_6_ipin_in),
            .io_opin_out(io_tile_3_6_opin_out),
            .io_x_loc(),
            .io_y_loc(),
            .clk(clock),
            .reset(rst)
        );

    wire [31:0] io_tile_4_6_ipin_in;
    wire [7:0] io_tile_4_6_opin_out;
    io_tile_sp_8 io_tile_4_6(
            .io_configs_in(configs_in[223:192]),
            .io_configs_en(configs_en[26:26]),
            .io_io_input(right_in[31:24]),
            .io_io_output(right_out[31:24]),
            .io_ipin_in(io_tile_4_6_ipin_in),
            .io_opin_out(io_tile_4_6_opin_out),
            .io_x_loc(),
            .io_y_loc(),
            .clk(clock),
            .reset(rst)
        );

    wire [31:0] io_tile_5_6_ipin_in;
    wire [7:0] io_tile_5_6_opin_out;
    io_tile_sp_9 io_tile_5_6(
            .io_configs_in(configs_in[223:192]),
            .io_configs_en(configs_en[34:34]),
            .io_io_input(right_in[39:32]),
            .io_io_output(right_out[39:32]),
            .io_ipin_in(io_tile_5_6_ipin_in),
            .io_opin_out(io_tile_5_6_opin_out),
            .io_x_loc(),
            .io_y_loc(),
            .clk(clock),
            .reset(rst)
        );

    wire [80:0] io_tile_0_1_chanxy_in;
    wire [24:0] io_tile_0_1_chanxy_out;
    wire [31:0] io_tile_0_1_ipin_in;
    wire [7:0] io_tile_0_1_opin_out;
    io_tile_sp_10 io_tile_0_1(
            .io_chanxy_in(io_tile_0_1_chanxy_in),
            .io_chanxy_out(io_tile_0_1_chanxy_out),
            .io_configs_in(configs_in[63:32]),
            .io_configs_en(configs_en[1:0]),
            .io_io_input(bot_in[7:0]),
            .io_io_output(bot_out[7:0]),
            .io_ipin_in(io_tile_0_1_ipin_in),
            .io_opin_out(io_tile_0_1_opin_out),
            .io_x_loc(),
            .io_y_loc(),
            .clk(clock),
            .reset(rst)
        );

    wire [85:0] io_tile_0_2_chanxy_in;
    wire [9:0] io_tile_0_2_chanxy_out;
    wire [31:0] io_tile_0_2_ipin_in;
    wire [7:0] io_tile_0_2_opin_out;
    io_tile_sp_11 io_tile_0_2(
            .io_chanxy_in(io_tile_0_2_chanxy_in),
            .io_chanxy_out(io_tile_0_2_chanxy_out),
            .io_configs_in(configs_in[95:64]),
            .io_configs_en(configs_en[1:0]),
            .io_io_input(bot_in[15:8]),
            .io_io_output(bot_out[15:8]),
            .io_ipin_in(io_tile_0_2_ipin_in),
            .io_opin_out(io_tile_0_2_opin_out),
            .io_x_loc(),
            .io_y_loc(),
            .clk(clock),
            .reset(rst)
        );

    wire [85:0] io_tile_0_3_chanxy_in;
    wire [9:0] io_tile_0_3_chanxy_out;
    wire [31:0] io_tile_0_3_ipin_in;
    wire [7:0] io_tile_0_3_opin_out;
    io_tile_sp_12 io_tile_0_3(
            .io_chanxy_in(io_tile_0_3_chanxy_in),
            .io_chanxy_out(io_tile_0_3_chanxy_out),
            .io_configs_in(configs_in[127:96]),
            .io_configs_en(configs_en[1:0]),
            .io_io_input(bot_in[23:16]),
            .io_io_output(bot_out[23:16]),
            .io_ipin_in(io_tile_0_3_ipin_in),
            .io_opin_out(io_tile_0_3_opin_out),
            .io_x_loc(),
            .io_y_loc(),
            .clk(clock),
            .reset(rst)
        );

    wire [85:0] io_tile_0_4_chanxy_in;
    wire [9:0] io_tile_0_4_chanxy_out;
    wire [31:0] io_tile_0_4_ipin_in;
    wire [7:0] io_tile_0_4_opin_out;
    io_tile_sp_13 io_tile_0_4(
            .io_chanxy_in(io_tile_0_4_chanxy_in),
            .io_chanxy_out(io_tile_0_4_chanxy_out),
            .io_configs_in(configs_in[159:128]),
            .io_configs_en(configs_en[1:0]),
            .io_io_input(bot_in[31:24]),
            .io_io_output(bot_out[31:24]),
            .io_ipin_in(io_tile_0_4_ipin_in),
            .io_opin_out(io_tile_0_4_opin_out),
            .io_x_loc(),
            .io_y_loc(),
            .clk(clock),
            .reset(rst)
        );

    wire [80:0] io_tile_0_5_chanxy_in;
    wire [24:0] io_tile_0_5_chanxy_out;
    wire [31:0] io_tile_0_5_ipin_in;
    wire [7:0] io_tile_0_5_opin_out;
    io_tile_sp_14 io_tile_0_5(
            .io_chanxy_in(io_tile_0_5_chanxy_in),
            .io_chanxy_out(io_tile_0_5_chanxy_out),
            .io_configs_in(configs_in[191:160]),
            .io_configs_en(configs_en[1:0]),
            .io_io_input(bot_in[39:32]),
            .io_io_output(bot_out[39:32]),
            .io_ipin_in(io_tile_0_5_ipin_in),
            .io_opin_out(io_tile_0_5_opin_out),
            .io_x_loc(),
            .io_y_loc(),
            .clk(clock),
            .reset(rst)
        );

    wire [31:0] io_tile_6_1_ipin_in;
    wire [7:0] io_tile_6_1_opin_out;
    io_tile_sp_15 io_tile_6_1(
            .io_configs_in(configs_in[63:32]),
            .io_configs_en(configs_en[42:42]),
            .io_io_input(top_in[7:0]),
            .io_io_output(top_out[7:0]),
            .io_ipin_in(io_tile_6_1_ipin_in),
            .io_opin_out(io_tile_6_1_opin_out),
            .io_x_loc(),
            .io_y_loc(),
            .clk(clock),
            .reset(rst)
        );

    wire [31:0] io_tile_6_2_ipin_in;
    wire [7:0] io_tile_6_2_opin_out;
    io_tile_sp_16 io_tile_6_2(
            .io_configs_in(configs_in[95:64]),
            .io_configs_en(configs_en[42:42]),
            .io_io_input(top_in[15:8]),
            .io_io_output(top_out[15:8]),
            .io_ipin_in(io_tile_6_2_ipin_in),
            .io_opin_out(io_tile_6_2_opin_out),
            .io_x_loc(),
            .io_y_loc(),
            .clk(clock),
            .reset(rst)
        );

    wire [31:0] io_tile_6_3_ipin_in;
    wire [7:0] io_tile_6_3_opin_out;
    io_tile_sp_17 io_tile_6_3(
            .io_configs_in(configs_in[127:96]),
            .io_configs_en(configs_en[42:42]),
            .io_io_input(top_in[23:16]),
            .io_io_output(top_out[23:16]),
            .io_ipin_in(io_tile_6_3_ipin_in),
            .io_opin_out(io_tile_6_3_opin_out),
            .io_x_loc(),
            .io_y_loc(),
            .clk(clock),
            .reset(rst)
        );

    wire [31:0] io_tile_6_4_ipin_in;
    wire [7:0] io_tile_6_4_opin_out;
    io_tile_sp_18 io_tile_6_4(
            .io_configs_in(configs_in[159:128]),
            .io_configs_en(configs_en[42:42]),
            .io_io_input(top_in[31:24]),
            .io_io_output(top_out[31:24]),
            .io_ipin_in(io_tile_6_4_ipin_in),
            .io_opin_out(io_tile_6_4_opin_out),
            .io_x_loc(),
            .io_y_loc(),
            .clk(clock),
            .reset(rst)
        );

    wire [31:0] io_tile_6_5_ipin_in;
    wire [7:0] io_tile_6_5_opin_out;
    io_tile_sp_19 io_tile_6_5(
            .io_configs_in(configs_in[191:160]),
            .io_configs_en(configs_en[42:42]),
            .io_io_input(top_in[39:32]),
            .io_io_output(top_out[39:32]),
            .io_ipin_in(io_tile_6_5_ipin_in),
            .io_opin_out(io_tile_6_5_opin_out),
            .io_x_loc(),
            .io_y_loc(),
            .clk(clock),
            .reset(rst)
        );



    // FPGA LUT TILES DECLARE
    wire [185:0] lut_tile_1_1_chanxy_in;
    wire [49:0] lut_tile_1_1_chanxy_out;
    wire [43:0] lut_tile_1_1_ipin_in;
    wire [3:0] lut_tile_1_1_opin_out;
    lut_tile_sp_0 lut_tile_1_1(
            .io_chanxy_in(lut_tile_1_1_chanxy_in),
            .io_chanxy_out(lut_tile_1_1_chanxy_out),
            .io_configs_in(configs_in[63:32]),
            .io_configs_en(configs_en[9:2]),
            .io_ipin_in(lut_tile_1_1_ipin_in),
            .io_opin_out(lut_tile_1_1_opin_out),
            .io_x_loc(),
            .io_y_loc(),
            .io_ff_en(ff_en),
            .clk(clock),
            .reset(rst)
        );

    wire [190:0] lut_tile_2_1_chanxy_in;
    wire [34:0] lut_tile_2_1_chanxy_out;
    wire [43:0] lut_tile_2_1_ipin_in;
    wire [3:0] lut_tile_2_1_opin_out;
    lut_tile_sp_1 lut_tile_2_1(
            .io_chanxy_in(lut_tile_2_1_chanxy_in),
            .io_chanxy_out(lut_tile_2_1_chanxy_out),
            .io_configs_in(configs_in[63:32]),
            .io_configs_en(configs_en[17:10]),
            .io_ipin_in(lut_tile_2_1_ipin_in),
            .io_opin_out(lut_tile_2_1_opin_out),
            .io_x_loc(),
            .io_y_loc(),
            .io_ff_en(ff_en),
            .clk(clock),
            .reset(rst)
        );

    wire [190:0] lut_tile_3_1_chanxy_in;
    wire [34:0] lut_tile_3_1_chanxy_out;
    wire [43:0] lut_tile_3_1_ipin_in;
    wire [3:0] lut_tile_3_1_opin_out;
    lut_tile_sp_2 lut_tile_3_1(
            .io_chanxy_in(lut_tile_3_1_chanxy_in),
            .io_chanxy_out(lut_tile_3_1_chanxy_out),
            .io_configs_in(configs_in[63:32]),
            .io_configs_en(configs_en[25:18]),
            .io_ipin_in(lut_tile_3_1_ipin_in),
            .io_opin_out(lut_tile_3_1_opin_out),
            .io_x_loc(),
            .io_y_loc(),
            .io_ff_en(ff_en),
            .clk(clock),
            .reset(rst)
        );

    wire [190:0] lut_tile_4_1_chanxy_in;
    wire [34:0] lut_tile_4_1_chanxy_out;
    wire [43:0] lut_tile_4_1_ipin_in;
    wire [3:0] lut_tile_4_1_opin_out;
    lut_tile_sp_3 lut_tile_4_1(
            .io_chanxy_in(lut_tile_4_1_chanxy_in),
            .io_chanxy_out(lut_tile_4_1_chanxy_out),
            .io_configs_in(configs_in[63:32]),
            .io_configs_en(configs_en[33:26]),
            .io_ipin_in(lut_tile_4_1_ipin_in),
            .io_opin_out(lut_tile_4_1_opin_out),
            .io_x_loc(),
            .io_y_loc(),
            .io_ff_en(ff_en),
            .clk(clock),
            .reset(rst)
        );

    wire [173:0] lut_tile_5_1_chanxy_in;
    wire [49:0] lut_tile_5_1_chanxy_out;
    wire [43:0] lut_tile_5_1_ipin_in;
    wire [3:0] lut_tile_5_1_opin_out;
    lut_tile_sp_4 lut_tile_5_1(
            .io_chanxy_in(lut_tile_5_1_chanxy_in),
            .io_chanxy_out(lut_tile_5_1_chanxy_out),
            .io_configs_in(configs_in[63:32]),
            .io_configs_en(configs_en[41:34]),
            .io_ipin_in(lut_tile_5_1_ipin_in),
            .io_opin_out(lut_tile_5_1_opin_out),
            .io_x_loc(),
            .io_y_loc(),
            .io_ff_en(ff_en),
            .clk(clock),
            .reset(rst)
        );

    wire [173:0] lut_tile_1_5_chanxy_in;
    wire [49:0] lut_tile_1_5_chanxy_out;
    wire [43:0] lut_tile_1_5_ipin_in;
    wire [3:0] lut_tile_1_5_opin_out;
    lut_tile_sp_5 lut_tile_1_5(
            .io_chanxy_in(lut_tile_1_5_chanxy_in),
            .io_chanxy_out(lut_tile_1_5_chanxy_out),
            .io_configs_in(configs_in[191:160]),
            .io_configs_en(configs_en[9:2]),
            .io_ipin_in(lut_tile_1_5_ipin_in),
            .io_opin_out(lut_tile_1_5_opin_out),
            .io_x_loc(),
            .io_y_loc(),
            .io_ff_en(ff_en),
            .clk(clock),
            .reset(rst)
        );

    wire [178:0] lut_tile_2_5_chanxy_in;
    wire [34:0] lut_tile_2_5_chanxy_out;
    wire [43:0] lut_tile_2_5_ipin_in;
    wire [3:0] lut_tile_2_5_opin_out;
    lut_tile_sp_6 lut_tile_2_5(
            .io_chanxy_in(lut_tile_2_5_chanxy_in),
            .io_chanxy_out(lut_tile_2_5_chanxy_out),
            .io_configs_in(configs_in[191:160]),
            .io_configs_en(configs_en[17:10]),
            .io_ipin_in(lut_tile_2_5_ipin_in),
            .io_opin_out(lut_tile_2_5_opin_out),
            .io_x_loc(),
            .io_y_loc(),
            .io_ff_en(ff_en),
            .clk(clock),
            .reset(rst)
        );

    wire [178:0] lut_tile_3_5_chanxy_in;
    wire [34:0] lut_tile_3_5_chanxy_out;
    wire [43:0] lut_tile_3_5_ipin_in;
    wire [3:0] lut_tile_3_5_opin_out;
    lut_tile_sp_7 lut_tile_3_5(
            .io_chanxy_in(lut_tile_3_5_chanxy_in),
            .io_chanxy_out(lut_tile_3_5_chanxy_out),
            .io_configs_in(configs_in[191:160]),
            .io_configs_en(configs_en[25:18]),
            .io_ipin_in(lut_tile_3_5_ipin_in),
            .io_opin_out(lut_tile_3_5_opin_out),
            .io_x_loc(),
            .io_y_loc(),
            .io_ff_en(ff_en),
            .clk(clock),
            .reset(rst)
        );

    wire [178:0] lut_tile_4_5_chanxy_in;
    wire [34:0] lut_tile_4_5_chanxy_out;
    wire [43:0] lut_tile_4_5_ipin_in;
    wire [3:0] lut_tile_4_5_opin_out;
    lut_tile_sp_8 lut_tile_4_5(
            .io_chanxy_in(lut_tile_4_5_chanxy_in),
            .io_chanxy_out(lut_tile_4_5_chanxy_out),
            .io_configs_in(configs_in[191:160]),
            .io_configs_en(configs_en[33:26]),
            .io_ipin_in(lut_tile_4_5_ipin_in),
            .io_opin_out(lut_tile_4_5_opin_out),
            .io_x_loc(),
            .io_y_loc(),
            .io_ff_en(ff_en),
            .clk(clock),
            .reset(rst)
        );

    wire [161:0] lut_tile_5_5_chanxy_in;
    wire [49:0] lut_tile_5_5_chanxy_out;
    wire [43:0] lut_tile_5_5_ipin_in;
    wire [3:0] lut_tile_5_5_opin_out;
    lut_tile_sp_9 lut_tile_5_5(
            .io_chanxy_in(lut_tile_5_5_chanxy_in),
            .io_chanxy_out(lut_tile_5_5_chanxy_out),
            .io_configs_in(configs_in[191:160]),
            .io_configs_en(configs_en[41:34]),
            .io_ipin_in(lut_tile_5_5_ipin_in),
            .io_opin_out(lut_tile_5_5_opin_out),
            .io_x_loc(),
            .io_y_loc(),
            .io_ff_en(ff_en),
            .clk(clock),
            .reset(rst)
        );

    wire [190:0] lut_tile_1_2_chanxy_in;
    wire [34:0] lut_tile_1_2_chanxy_out;
    wire [43:0] lut_tile_1_2_ipin_in;
    wire [3:0] lut_tile_1_2_opin_out;
    lut_tile_sp_10 lut_tile_1_2(
            .io_chanxy_in(lut_tile_1_2_chanxy_in),
            .io_chanxy_out(lut_tile_1_2_chanxy_out),
            .io_configs_in(configs_in[95:64]),
            .io_configs_en(configs_en[9:2]),
            .io_ipin_in(lut_tile_1_2_ipin_in),
            .io_opin_out(lut_tile_1_2_opin_out),
            .io_x_loc(),
            .io_y_loc(),
            .io_ff_en(ff_en),
            .clk(clock),
            .reset(rst)
        );

    wire [190:0] lut_tile_1_3_chanxy_in;
    wire [34:0] lut_tile_1_3_chanxy_out;
    wire [43:0] lut_tile_1_3_ipin_in;
    wire [3:0] lut_tile_1_3_opin_out;
    lut_tile_sp_11 lut_tile_1_3(
            .io_chanxy_in(lut_tile_1_3_chanxy_in),
            .io_chanxy_out(lut_tile_1_3_chanxy_out),
            .io_configs_in(configs_in[127:96]),
            .io_configs_en(configs_en[9:2]),
            .io_ipin_in(lut_tile_1_3_ipin_in),
            .io_opin_out(lut_tile_1_3_opin_out),
            .io_x_loc(),
            .io_y_loc(),
            .io_ff_en(ff_en),
            .clk(clock),
            .reset(rst)
        );

    wire [190:0] lut_tile_1_4_chanxy_in;
    wire [34:0] lut_tile_1_4_chanxy_out;
    wire [43:0] lut_tile_1_4_ipin_in;
    wire [3:0] lut_tile_1_4_opin_out;
    lut_tile_sp_12 lut_tile_1_4(
            .io_chanxy_in(lut_tile_1_4_chanxy_in),
            .io_chanxy_out(lut_tile_1_4_chanxy_out),
            .io_configs_in(configs_in[159:128]),
            .io_configs_en(configs_en[9:2]),
            .io_ipin_in(lut_tile_1_4_ipin_in),
            .io_opin_out(lut_tile_1_4_opin_out),
            .io_x_loc(),
            .io_y_loc(),
            .io_ff_en(ff_en),
            .clk(clock),
            .reset(rst)
        );

    wire [178:0] lut_tile_5_2_chanxy_in;
    wire [34:0] lut_tile_5_2_chanxy_out;
    wire [43:0] lut_tile_5_2_ipin_in;
    wire [3:0] lut_tile_5_2_opin_out;
    lut_tile_sp_13 lut_tile_5_2(
            .io_chanxy_in(lut_tile_5_2_chanxy_in),
            .io_chanxy_out(lut_tile_5_2_chanxy_out),
            .io_configs_in(configs_in[95:64]),
            .io_configs_en(configs_en[41:34]),
            .io_ipin_in(lut_tile_5_2_ipin_in),
            .io_opin_out(lut_tile_5_2_opin_out),
            .io_x_loc(),
            .io_y_loc(),
            .io_ff_en(ff_en),
            .clk(clock),
            .reset(rst)
        );

    wire [178:0] lut_tile_5_3_chanxy_in;
    wire [34:0] lut_tile_5_3_chanxy_out;
    wire [43:0] lut_tile_5_3_ipin_in;
    wire [3:0] lut_tile_5_3_opin_out;
    lut_tile_sp_14 lut_tile_5_3(
            .io_chanxy_in(lut_tile_5_3_chanxy_in),
            .io_chanxy_out(lut_tile_5_3_chanxy_out),
            .io_configs_in(configs_in[127:96]),
            .io_configs_en(configs_en[41:34]),
            .io_ipin_in(lut_tile_5_3_ipin_in),
            .io_opin_out(lut_tile_5_3_opin_out),
            .io_x_loc(),
            .io_y_loc(),
            .io_ff_en(ff_en),
            .clk(clock),
            .reset(rst)
        );

    wire [178:0] lut_tile_5_4_chanxy_in;
    wire [34:0] lut_tile_5_4_chanxy_out;
    wire [43:0] lut_tile_5_4_ipin_in;
    wire [3:0] lut_tile_5_4_opin_out;
    lut_tile_sp_15 lut_tile_5_4(
            .io_chanxy_in(lut_tile_5_4_chanxy_in),
            .io_chanxy_out(lut_tile_5_4_chanxy_out),
            .io_configs_in(configs_in[159:128]),
            .io_configs_en(configs_en[41:34]),
            .io_ipin_in(lut_tile_5_4_ipin_in),
            .io_opin_out(lut_tile_5_4_opin_out),
            .io_x_loc(),
            .io_y_loc(),
            .io_ff_en(ff_en),
            .clk(clock),
            .reset(rst)
        );

    wire [195:0] lut_tile_2_2_chanxy_in;
    wire [19:0] lut_tile_2_2_chanxy_out;
    wire [43:0] lut_tile_2_2_ipin_in;
    wire [3:0] lut_tile_2_2_opin_out;
    lut_tile lut_tile_2_2(
            .io_chanxy_in(lut_tile_2_2_chanxy_in),
            .io_chanxy_out(lut_tile_2_2_chanxy_out),
            .io_configs_in(configs_in[95:64]),
            .io_configs_en(configs_en[17:10]),
            .io_ipin_in(lut_tile_2_2_ipin_in),
            .io_opin_out(lut_tile_2_2_opin_out),
            .io_ff_en(ff_en),
            .clk(clock),
            .reset(rst)
        );

    wire [195:0] lut_tile_2_3_chanxy_in;
    wire [19:0] lut_tile_2_3_chanxy_out;
    wire [43:0] lut_tile_2_3_ipin_in;
    wire [3:0] lut_tile_2_3_opin_out;
    lut_tile lut_tile_2_3(
            .io_chanxy_in(lut_tile_2_3_chanxy_in),
            .io_chanxy_out(lut_tile_2_3_chanxy_out),
            .io_configs_in(configs_in[127:96]),
            .io_configs_en(configs_en[17:10]),
            .io_ipin_in(lut_tile_2_3_ipin_in),
            .io_opin_out(lut_tile_2_3_opin_out),
            .io_ff_en(ff_en),
            .clk(clock),
            .reset(rst)
        );

    wire [195:0] lut_tile_2_4_chanxy_in;
    wire [19:0] lut_tile_2_4_chanxy_out;
    wire [43:0] lut_tile_2_4_ipin_in;
    wire [3:0] lut_tile_2_4_opin_out;
    lut_tile lut_tile_2_4(
            .io_chanxy_in(lut_tile_2_4_chanxy_in),
            .io_chanxy_out(lut_tile_2_4_chanxy_out),
            .io_configs_in(configs_in[159:128]),
            .io_configs_en(configs_en[17:10]),
            .io_ipin_in(lut_tile_2_4_ipin_in),
            .io_opin_out(lut_tile_2_4_opin_out),
            .io_ff_en(ff_en),
            .clk(clock),
            .reset(rst)
        );

    wire [195:0] lut_tile_3_2_chanxy_in;
    wire [19:0] lut_tile_3_2_chanxy_out;
    wire [43:0] lut_tile_3_2_ipin_in;
    wire [3:0] lut_tile_3_2_opin_out;
    lut_tile lut_tile_3_2(
            .io_chanxy_in(lut_tile_3_2_chanxy_in),
            .io_chanxy_out(lut_tile_3_2_chanxy_out),
            .io_configs_in(configs_in[95:64]),
            .io_configs_en(configs_en[25:18]),
            .io_ipin_in(lut_tile_3_2_ipin_in),
            .io_opin_out(lut_tile_3_2_opin_out),
            .io_ff_en(ff_en),
            .clk(clock),
            .reset(rst)
        );

    wire [195:0] lut_tile_3_3_chanxy_in;
    wire [19:0] lut_tile_3_3_chanxy_out;
    wire [43:0] lut_tile_3_3_ipin_in;
    wire [3:0] lut_tile_3_3_opin_out;
    lut_tile lut_tile_3_3(
            .io_chanxy_in(lut_tile_3_3_chanxy_in),
            .io_chanxy_out(lut_tile_3_3_chanxy_out),
            .io_configs_in(configs_in[127:96]),
            .io_configs_en(configs_en[25:18]),
            .io_ipin_in(lut_tile_3_3_ipin_in),
            .io_opin_out(lut_tile_3_3_opin_out),
            .io_ff_en(ff_en),
            .clk(clock),
            .reset(rst)
        );

    wire [195:0] lut_tile_3_4_chanxy_in;
    wire [19:0] lut_tile_3_4_chanxy_out;
    wire [43:0] lut_tile_3_4_ipin_in;
    wire [3:0] lut_tile_3_4_opin_out;
    lut_tile lut_tile_3_4(
            .io_chanxy_in(lut_tile_3_4_chanxy_in),
            .io_chanxy_out(lut_tile_3_4_chanxy_out),
            .io_configs_in(configs_in[159:128]),
            .io_configs_en(configs_en[25:18]),
            .io_ipin_in(lut_tile_3_4_ipin_in),
            .io_opin_out(lut_tile_3_4_opin_out),
            .io_ff_en(ff_en),
            .clk(clock),
            .reset(rst)
        );

    wire [195:0] lut_tile_4_2_chanxy_in;
    wire [19:0] lut_tile_4_2_chanxy_out;
    wire [43:0] lut_tile_4_2_ipin_in;
    wire [3:0] lut_tile_4_2_opin_out;
    lut_tile lut_tile_4_2(
            .io_chanxy_in(lut_tile_4_2_chanxy_in),
            .io_chanxy_out(lut_tile_4_2_chanxy_out),
            .io_configs_in(configs_in[95:64]),
            .io_configs_en(configs_en[33:26]),
            .io_ipin_in(lut_tile_4_2_ipin_in),
            .io_opin_out(lut_tile_4_2_opin_out),
            .io_ff_en(ff_en),
            .clk(clock),
            .reset(rst)
        );

    wire [195:0] lut_tile_4_3_chanxy_in;
    wire [19:0] lut_tile_4_3_chanxy_out;
    wire [43:0] lut_tile_4_3_ipin_in;
    wire [3:0] lut_tile_4_3_opin_out;
    lut_tile lut_tile_4_3(
            .io_chanxy_in(lut_tile_4_3_chanxy_in),
            .io_chanxy_out(lut_tile_4_3_chanxy_out),
            .io_configs_in(configs_in[127:96]),
            .io_configs_en(configs_en[33:26]),
            .io_ipin_in(lut_tile_4_3_ipin_in),
            .io_opin_out(lut_tile_4_3_opin_out),
            .io_ff_en(ff_en),
            .clk(clock),
            .reset(rst)
        );

    wire [195:0] lut_tile_4_4_chanxy_in;
    wire [19:0] lut_tile_4_4_chanxy_out;
    wire [43:0] lut_tile_4_4_ipin_in;
    wire [3:0] lut_tile_4_4_opin_out;
    lut_tile lut_tile_4_4(
            .io_chanxy_in(lut_tile_4_4_chanxy_in),
            .io_chanxy_out(lut_tile_4_4_chanxy_out),
            .io_configs_in(configs_in[159:128]),
            .io_configs_en(configs_en[33:26]),
            .io_ipin_in(lut_tile_4_4_ipin_in),
            .io_opin_out(lut_tile_4_4_opin_out),
            .io_ff_en(ff_en),
            .clk(clock),
            .reset(rst)
        );



    // LUT TILE IPIN
    assign lut_tile_1_1_ipin_in = {wire_1549, wire_1548, wire_1529, wire_1528, wire_2105, wire_2104, wire_2093, wire_2092, wire_1623, wire_1622, wire_1603, wire_1602, wire_2023, wire_2022, wire_2003, wire_2002, wire_1541, wire_1540, wire_1521, wire_1520, wire_2097, wire_2096, wire_2085, wire_2084, wire_1615, wire_1614, wire_1595, wire_1594, wire_2015, wire_2014, wire_1995, wire_1994, wire_1533, wire_1532, wire_1513, wire_1512, wire_2089, wire_2088, wire_2077, wire_2076, wire_1609, wire_1608, wire_1597, wire_1596};
    // IPIN TOTAL: 44
    assign lut_tile_2_1_ipin_in = {wire_1627, wire_1626, wire_1607, wire_1606, wire_2115, wire_2114, wire_2103, wire_2102, wire_1709, wire_1708, wire_1681, wire_1680, wire_2033, wire_2032, wire_2029, wire_2028, wire_1619, wire_1618, wire_1599, wire_1598, wire_2113, wire_2112, wire_2095, wire_2094, wire_1701, wire_1700, wire_1673, wire_1672, wire_2031, wire_2030, wire_2021, wire_2020, wire_1611, wire_1610, wire_1591, wire_1590, wire_2111, wire_2110, wire_2087, wire_2086, wire_1687, wire_1686, wire_1675, wire_1674};
    // IPIN TOTAL: 44
    assign lut_tile_3_1_ipin_in = {wire_1705, wire_1704, wire_1693, wire_1692, wire_2129, wire_2128, wire_2089, wire_2088, wire_1787, wire_1786, wire_1759, wire_1758, wire_2049, wire_2048, wire_1999, wire_1998, wire_1697, wire_1696, wire_1685, wire_1684, wire_2127, wire_2126, wire_2081, wire_2080, wire_1779, wire_1778, wire_1751, wire_1750, wire_2047, wire_2046, wire_1991, wire_1990, wire_1689, wire_1688, wire_1677, wire_1676, wire_2125, wire_2124, wire_2073, wire_2072, wire_1773, wire_1772, wire_1753, wire_1752};
    // IPIN TOTAL: 44
    assign lut_tile_4_1_ipin_in = {wire_1783, wire_1782, wire_1771, wire_1770, wire_2135, wire_2134, wire_2119, wire_2118, wire_1865, wire_1864, wire_1845, wire_1844, wire_2053, wire_2052, wire_2039, wire_2038, wire_1775, wire_1774, wire_1763, wire_1762, wire_2133, wire_2132, wire_2117, wire_2116, wire_1857, wire_1856, wire_1837, wire_1836, wire_2051, wire_2050, wire_2037, wire_2036, wire_1767, wire_1766, wire_1755, wire_1754, wire_2131, wire_2130, wire_2115, wire_2114, wire_1851, wire_1850, wire_1831, wire_1830};
    // IPIN TOTAL: 44
    assign lut_tile_5_1_ipin_in = {wire_1869, wire_1868, wire_1849, wire_1848, wire_2149, wire_2148, wire_2125, wire_2124, wire_1943, wire_1942, wire_1923, wire_1922, wire_2069, wire_2068, wire_2043, wire_2042, wire_1861, wire_1860, wire_1841, wire_1840, wire_2147, wire_2146, wire_2123, wire_2122, wire_1935, wire_1934, wire_1915, wire_1914, wire_2067, wire_2066, wire_2041, wire_2040, wire_1853, wire_1852, wire_1833, wire_1832, wire_2145, wire_2144, wire_2121, wire_2120, wire_1929, wire_1928, wire_1917, wire_1916};
    // IPIN TOTAL: 44
    assign lut_tile_1_2_ipin_in = {wire_1547, wire_1546, wire_1527, wire_1526, wire_2183, wire_2182, wire_2171, wire_2170, wire_1629, wire_1628, wire_1601, wire_1600, wire_2109, wire_2108, wire_2081, wire_2080, wire_1539, wire_1538, wire_1519, wire_1518, wire_2175, wire_2174, wire_2163, wire_2162, wire_1621, wire_1620, wire_1593, wire_1592, wire_2101, wire_2100, wire_2073, wire_2072, wire_1531, wire_1530, wire_1511, wire_1510, wire_2167, wire_2166, wire_2155, wire_2154, wire_1631, wire_1630, wire_1607, wire_1606};
    // IPIN TOTAL: 44
    assign lut_tile_2_2_ipin_in = {wire_1625, wire_1624, wire_1613, wire_1612, wire_2199, wire_2198, wire_2169, wire_2168, wire_1707, wire_1706, wire_1679, wire_1678, wire_2119, wire_2118, wire_2079, wire_2078, wire_1617, wire_1616, wire_1605, wire_1604, wire_2197, wire_2196, wire_2161, wire_2160, wire_1699, wire_1698, wire_1671, wire_1670, wire_2117, wire_2116, wire_2071, wire_2070, wire_1609, wire_1608, wire_1597, wire_1596, wire_2195, wire_2194, wire_2153, wire_2152, wire_1715, wire_1714, wire_1673, wire_1672};
    // IPIN TOTAL: 44
    assign lut_tile_3_2_ipin_in = {wire_1703, wire_1702, wire_1691, wire_1690, wire_2205, wire_2204, wire_2187, wire_2186, wire_1785, wire_1784, wire_1765, wire_1764, wire_2123, wire_2122, wire_2105, wire_2104, wire_1695, wire_1694, wire_1683, wire_1682, wire_2203, wire_2202, wire_2179, wire_2178, wire_1777, wire_1776, wire_1757, wire_1756, wire_2121, wire_2120, wire_2097, wire_2096, wire_1687, wire_1686, wire_1675, wire_1674, wire_2201, wire_2200, wire_2171, wire_2170, wire_1791, wire_1790, wire_1771, wire_1770};
    // IPIN TOTAL: 44
    assign lut_tile_4_2_ipin_in = {wire_1789, wire_1788, wire_1769, wire_1768, wire_2219, wire_2218, wire_2195, wire_2194, wire_1863, wire_1862, wire_1843, wire_1842, wire_2139, wire_2138, wire_2113, wire_2112, wire_1781, wire_1780, wire_1761, wire_1760, wire_2217, wire_2216, wire_2193, wire_2192, wire_1855, wire_1854, wire_1835, wire_1834, wire_2137, wire_2136, wire_2111, wire_2110, wire_1773, wire_1772, wire_1753, wire_1752, wire_2215, wire_2214, wire_2191, wire_2190, wire_1875, wire_1874, wire_1837, wire_1836};
    // IPIN TOTAL: 44
    assign lut_tile_5_2_ipin_in = {wire_1867, wire_1866, wire_1847, wire_1846, wire_2225, wire_2224, wire_2209, wire_2208, wire_1949, wire_1948, wire_1921, wire_1920, wire_2143, wire_2142, wire_2129, wire_2128, wire_1859, wire_1858, wire_1839, wire_1838, wire_2223, wire_2222, wire_2207, wire_2206, wire_1941, wire_1940, wire_1913, wire_1912, wire_2141, wire_2140, wire_2127, wire_2126, wire_1851, wire_1850, wire_1831, wire_1830, wire_2221, wire_2220, wire_2205, wire_2204, wire_1951, wire_1950, wire_1927, wire_1926};
    // IPIN TOTAL: 44
    assign lut_tile_1_3_ipin_in = {wire_1559, wire_1558, wire_1533, wire_1532, wire_2269, wire_2268, wire_2249, wire_2248, wire_1639, wire_1638, wire_1599, wire_1598, wire_2187, wire_2186, wire_2159, wire_2158, wire_1557, wire_1556, wire_1525, wire_1524, wire_2261, wire_2260, wire_2241, wire_2240, wire_1637, wire_1636, wire_1591, wire_1590, wire_2179, wire_2178, wire_2151, wire_2150, wire_1555, wire_1554, wire_1517, wire_1516, wire_2253, wire_2252, wire_2233, wire_2232, wire_1645, wire_1644, wire_1593, wire_1592};
    // IPIN TOTAL: 44
    assign lut_tile_2_3_ipin_in = {wire_1635, wire_1634, wire_1623, wire_1622, wire_2275, wire_2274, wire_2267, wire_2266, wire_1713, wire_1712, wire_1705, wire_1704, wire_2193, wire_2192, wire_2185, wire_2184, wire_1633, wire_1632, wire_1615, wire_1614, wire_2273, wire_2272, wire_2259, wire_2258, wire_1711, wire_1710, wire_1697, wire_1696, wire_2191, wire_2190, wire_2177, wire_2176, wire_1631, wire_1630, wire_1607, wire_1606, wire_2271, wire_2270, wire_2251, wire_2250, wire_1721, wire_1720, wire_1691, wire_1690};
    // IPIN TOTAL: 44
    assign lut_tile_3_3_ipin_in = {wire_1719, wire_1718, wire_1689, wire_1688, wire_2289, wire_2288, wire_2253, wire_2252, wire_1799, wire_1798, wire_1763, wire_1762, wire_2209, wire_2208, wire_2163, wire_2162, wire_1717, wire_1716, wire_1681, wire_1680, wire_2287, wire_2286, wire_2245, wire_2244, wire_1797, wire_1796, wire_1755, wire_1754, wire_2207, wire_2206, wire_2155, wire_2154, wire_1715, wire_1714, wire_1673, wire_1672, wire_2285, wire_2284, wire_2237, wire_2236, wire_1805, wire_1804, wire_1757, wire_1756};
    // IPIN TOTAL: 44
    assign lut_tile_4_3_ipin_in = {wire_1795, wire_1794, wire_1787, wire_1786, wire_2295, wire_2294, wire_2279, wire_2278, wire_1873, wire_1872, wire_1869, wire_1868, wire_2213, wire_2212, wire_2199, wire_2198, wire_1793, wire_1792, wire_1779, wire_1778, wire_2293, wire_2292, wire_2277, wire_2276, wire_1871, wire_1870, wire_1861, wire_1860, wire_2211, wire_2210, wire_2197, wire_2196, wire_1791, wire_1790, wire_1771, wire_1770, wire_2291, wire_2290, wire_2275, wire_2274, wire_1881, wire_1880, wire_1847, wire_1846};
    // IPIN TOTAL: 44
    assign lut_tile_5_3_ipin_in = {wire_1879, wire_1878, wire_1853, wire_1852, wire_2309, wire_2308, wire_2285, wire_2284, wire_1959, wire_1958, wire_1919, wire_1918, wire_2229, wire_2228, wire_2203, wire_2202, wire_1877, wire_1876, wire_1845, wire_1844, wire_2307, wire_2306, wire_2283, wire_2282, wire_1957, wire_1956, wire_1911, wire_1910, wire_2227, wire_2226, wire_2201, wire_2200, wire_1875, wire_1874, wire_1837, wire_1836, wire_2305, wire_2304, wire_2281, wire_2280, wire_1965, wire_1964, wire_1913, wire_1912};
    // IPIN TOTAL: 44
    assign lut_tile_1_4_ipin_in = {wire_1565, wire_1564, wire_1543, wire_1542, wire_2347, wire_2346, wire_2327, wire_2326, wire_1643, wire_1642, wire_1625, wire_1624, wire_2265, wire_2264, wire_2245, wire_2244, wire_1563, wire_1562, wire_1535, wire_1534, wire_2339, wire_2338, wire_2319, wire_2318, wire_1641, wire_1640, wire_1617, wire_1616, wire_2257, wire_2256, wire_2237, wire_2236, wire_1561, wire_1560, wire_1527, wire_1526, wire_2331, wire_2330, wire_2311, wire_2310, wire_1651, wire_1650, wire_1635, wire_1634};
    // IPIN TOTAL: 44
    assign lut_tile_2_4_ipin_in = {wire_1649, wire_1648, wire_1609, wire_1608, wire_2359, wire_2358, wire_2333, wire_2332, wire_1729, wire_1728, wire_1683, wire_1682, wire_2279, wire_2278, wire_2243, wire_2242, wire_1647, wire_1646, wire_1601, wire_1600, wire_2357, wire_2356, wire_2325, wire_2324, wire_1727, wire_1726, wire_1675, wire_1674, wire_2277, wire_2276, wire_2235, wire_2234, wire_1645, wire_1644, wire_1593, wire_1592, wire_2355, wire_2354, wire_2317, wire_2316, wire_1735, wire_1734, wire_1711, wire_1710};
    // IPIN TOTAL: 44
    assign lut_tile_3_4_ipin_in = {wire_1725, wire_1724, wire_1707, wire_1706, wire_2365, wire_2364, wire_2343, wire_2342, wire_1803, wire_1802, wire_1789, wire_1788, wire_2283, wire_2282, wire_2269, wire_2268, wire_1723, wire_1722, wire_1699, wire_1698, wire_2363, wire_2362, wire_2335, wire_2334, wire_1801, wire_1800, wire_1781, wire_1780, wire_2281, wire_2280, wire_2261, wire_2260, wire_1721, wire_1720, wire_1691, wire_1690, wire_2361, wire_2360, wire_2327, wire_2326, wire_1811, wire_1810, wire_1795, wire_1794};
    // IPIN TOTAL: 44
    assign lut_tile_4_4_ipin_in = {wire_1809, wire_1808, wire_1773, wire_1772, wire_2379, wire_2378, wire_2355, wire_2354, wire_1889, wire_1888, wire_1839, wire_1838, wire_2299, wire_2298, wire_2273, wire_2272, wire_1807, wire_1806, wire_1765, wire_1764, wire_2377, wire_2376, wire_2353, wire_2352, wire_1887, wire_1886, wire_1831, wire_1830, wire_2297, wire_2296, wire_2271, wire_2270, wire_1805, wire_1804, wire_1757, wire_1756, wire_2375, wire_2374, wire_2351, wire_2350, wire_1895, wire_1894, wire_1871, wire_1870};
    // IPIN TOTAL: 44
    assign lut_tile_5_4_ipin_in = {wire_1885, wire_1884, wire_1863, wire_1862, wire_2385, wire_2384, wire_2369, wire_2368, wire_1963, wire_1962, wire_1945, wire_1944, wire_2303, wire_2302, wire_2289, wire_2288, wire_1883, wire_1882, wire_1855, wire_1854, wire_2383, wire_2382, wire_2367, wire_2366, wire_1961, wire_1960, wire_1937, wire_1936, wire_2301, wire_2300, wire_2287, wire_2286, wire_1881, wire_1880, wire_1847, wire_1846, wire_2381, wire_2380, wire_2365, wire_2364, wire_1971, wire_1970, wire_1955, wire_1954};
    // IPIN TOTAL: 44
    assign lut_tile_1_5_ipin_in = {wire_1579, wire_1578, wire_1555, wire_1554, wire_2425, wire_2424, wire_2413, wire_2412, wire_1659, wire_1658, wire_1633, wire_1632, wire_2343, wire_2342, wire_2323, wire_2322, wire_1577, wire_1576, wire_1553, wire_1552, wire_2417, wire_2416, wire_2405, wire_2404, wire_1657, wire_1656, wire_1631, wire_1630, wire_2335, wire_2334, wire_2315, wire_2314, wire_1575, wire_1574, wire_1551, wire_1550, wire_2409, wire_2408, wire_2397, wire_2396, wire_1665, wire_1664, wire_1641, wire_1640};
    // IPIN TOTAL: 44
    assign lut_tile_2_5_ipin_in = {wire_1655, wire_1654, wire_1639, wire_1638, wire_2435, wire_2434, wire_2423, wire_2422, wire_1733, wire_1732, wire_1719, wire_1718, wire_2353, wire_2352, wire_2349, wire_2348, wire_1653, wire_1652, wire_1637, wire_1636, wire_2433, wire_2432, wire_2415, wire_2414, wire_1731, wire_1730, wire_1717, wire_1716, wire_2351, wire_2350, wire_2341, wire_2340, wire_1651, wire_1650, wire_1635, wire_1634, wire_2431, wire_2430, wire_2407, wire_2406, wire_1741, wire_1740, wire_1725, wire_1724};
    // IPIN TOTAL: 44
    assign lut_tile_3_5_ipin_in = {wire_1739, wire_1738, wire_1715, wire_1714, wire_2449, wire_2448, wire_2409, wire_2408, wire_1819, wire_1818, wire_1793, wire_1792, wire_2369, wire_2368, wire_2319, wire_2318, wire_1737, wire_1736, wire_1713, wire_1712, wire_2447, wire_2446, wire_2401, wire_2400, wire_1817, wire_1816, wire_1791, wire_1790, wire_2367, wire_2366, wire_2311, wire_2310, wire_1735, wire_1734, wire_1711, wire_1710, wire_2445, wire_2444, wire_2393, wire_2392, wire_1825, wire_1824, wire_1801, wire_1800};
    // IPIN TOTAL: 44
    assign lut_tile_4_5_ipin_in = {wire_1815, wire_1814, wire_1799, wire_1798, wire_2455, wire_2454, wire_2439, wire_2438, wire_1893, wire_1892, wire_1879, wire_1878, wire_2373, wire_2372, wire_2359, wire_2358, wire_1813, wire_1812, wire_1797, wire_1796, wire_2453, wire_2452, wire_2437, wire_2436, wire_1891, wire_1890, wire_1877, wire_1876, wire_2371, wire_2370, wire_2357, wire_2356, wire_1811, wire_1810, wire_1795, wire_1794, wire_2451, wire_2450, wire_2435, wire_2434, wire_1901, wire_1900, wire_1885, wire_1884};
    // IPIN TOTAL: 44
    assign lut_tile_5_5_ipin_in = {wire_1899, wire_1898, wire_1875, wire_1874, wire_2469, wire_2468, wire_2445, wire_2444, wire_1979, wire_1978, wire_1953, wire_1952, wire_2389, wire_2388, wire_2363, wire_2362, wire_1897, wire_1896, wire_1873, wire_1872, wire_2467, wire_2466, wire_2443, wire_2442, wire_1977, wire_1976, wire_1951, wire_1950, wire_2387, wire_2386, wire_2361, wire_2360, wire_1895, wire_1894, wire_1871, wire_1870, wire_2465, wire_2464, wire_2441, wire_2440, wire_1985, wire_1984, wire_1961, wire_1960};
    // IPIN TOTAL: 44


    // FPGA TILE OPIN
    assign wire_305 = lut_tile_1_1_opin_out[0];
    assign wire_306 = lut_tile_1_1_opin_out[1];
    assign wire_307 = lut_tile_1_1_opin_out[2];
    assign wire_308 = lut_tile_1_1_opin_out[3];
    assign wire_511 = lut_tile_1_2_opin_out[0];
    assign wire_512 = lut_tile_1_2_opin_out[1];
    assign wire_513 = lut_tile_1_2_opin_out[2];
    assign wire_514 = lut_tile_1_2_opin_out[3];
    assign wire_717 = lut_tile_1_3_opin_out[0];
    assign wire_718 = lut_tile_1_3_opin_out[1];
    assign wire_719 = lut_tile_1_3_opin_out[2];
    assign wire_720 = lut_tile_1_3_opin_out[3];
    assign wire_923 = lut_tile_1_4_opin_out[0];
    assign wire_924 = lut_tile_1_4_opin_out[1];
    assign wire_925 = lut_tile_1_4_opin_out[2];
    assign wire_926 = lut_tile_1_4_opin_out[3];
    assign wire_1129 = lut_tile_1_5_opin_out[0];
    assign wire_1130 = lut_tile_1_5_opin_out[1];
    assign wire_1131 = lut_tile_1_5_opin_out[2];
    assign wire_1132 = lut_tile_1_5_opin_out[3];
    assign wire_327 = lut_tile_2_1_opin_out[0];
    assign wire_328 = lut_tile_2_1_opin_out[1];
    assign wire_329 = lut_tile_2_1_opin_out[2];
    assign wire_330 = lut_tile_2_1_opin_out[3];
    assign wire_533 = lut_tile_2_2_opin_out[0];
    assign wire_534 = lut_tile_2_2_opin_out[1];
    assign wire_535 = lut_tile_2_2_opin_out[2];
    assign wire_536 = lut_tile_2_2_opin_out[3];
    assign wire_739 = lut_tile_2_3_opin_out[0];
    assign wire_740 = lut_tile_2_3_opin_out[1];
    assign wire_741 = lut_tile_2_3_opin_out[2];
    assign wire_742 = lut_tile_2_3_opin_out[3];
    assign wire_945 = lut_tile_2_4_opin_out[0];
    assign wire_946 = lut_tile_2_4_opin_out[1];
    assign wire_947 = lut_tile_2_4_opin_out[2];
    assign wire_948 = lut_tile_2_4_opin_out[3];
    assign wire_1151 = lut_tile_2_5_opin_out[0];
    assign wire_1152 = lut_tile_2_5_opin_out[1];
    assign wire_1153 = lut_tile_2_5_opin_out[2];
    assign wire_1154 = lut_tile_2_5_opin_out[3];
    assign wire_349 = lut_tile_3_1_opin_out[0];
    assign wire_350 = lut_tile_3_1_opin_out[1];
    assign wire_351 = lut_tile_3_1_opin_out[2];
    assign wire_352 = lut_tile_3_1_opin_out[3];
    assign wire_555 = lut_tile_3_2_opin_out[0];
    assign wire_556 = lut_tile_3_2_opin_out[1];
    assign wire_557 = lut_tile_3_2_opin_out[2];
    assign wire_558 = lut_tile_3_2_opin_out[3];
    assign wire_761 = lut_tile_3_3_opin_out[0];
    assign wire_762 = lut_tile_3_3_opin_out[1];
    assign wire_763 = lut_tile_3_3_opin_out[2];
    assign wire_764 = lut_tile_3_3_opin_out[3];
    assign wire_967 = lut_tile_3_4_opin_out[0];
    assign wire_968 = lut_tile_3_4_opin_out[1];
    assign wire_969 = lut_tile_3_4_opin_out[2];
    assign wire_970 = lut_tile_3_4_opin_out[3];
    assign wire_1173 = lut_tile_3_5_opin_out[0];
    assign wire_1174 = lut_tile_3_5_opin_out[1];
    assign wire_1175 = lut_tile_3_5_opin_out[2];
    assign wire_1176 = lut_tile_3_5_opin_out[3];
    assign wire_371 = lut_tile_4_1_opin_out[0];
    assign wire_372 = lut_tile_4_1_opin_out[1];
    assign wire_373 = lut_tile_4_1_opin_out[2];
    assign wire_374 = lut_tile_4_1_opin_out[3];
    assign wire_577 = lut_tile_4_2_opin_out[0];
    assign wire_578 = lut_tile_4_2_opin_out[1];
    assign wire_579 = lut_tile_4_2_opin_out[2];
    assign wire_580 = lut_tile_4_2_opin_out[3];
    assign wire_783 = lut_tile_4_3_opin_out[0];
    assign wire_784 = lut_tile_4_3_opin_out[1];
    assign wire_785 = lut_tile_4_3_opin_out[2];
    assign wire_786 = lut_tile_4_3_opin_out[3];
    assign wire_989 = lut_tile_4_4_opin_out[0];
    assign wire_990 = lut_tile_4_4_opin_out[1];
    assign wire_991 = lut_tile_4_4_opin_out[2];
    assign wire_992 = lut_tile_4_4_opin_out[3];
    assign wire_1195 = lut_tile_4_5_opin_out[0];
    assign wire_1196 = lut_tile_4_5_opin_out[1];
    assign wire_1197 = lut_tile_4_5_opin_out[2];
    assign wire_1198 = lut_tile_4_5_opin_out[3];
    assign wire_393 = lut_tile_5_1_opin_out[0];
    assign wire_394 = lut_tile_5_1_opin_out[1];
    assign wire_395 = lut_tile_5_1_opin_out[2];
    assign wire_396 = lut_tile_5_1_opin_out[3];
    assign wire_599 = lut_tile_5_2_opin_out[0];
    assign wire_600 = lut_tile_5_2_opin_out[1];
    assign wire_601 = lut_tile_5_2_opin_out[2];
    assign wire_602 = lut_tile_5_2_opin_out[3];
    assign wire_805 = lut_tile_5_3_opin_out[0];
    assign wire_806 = lut_tile_5_3_opin_out[1];
    assign wire_807 = lut_tile_5_3_opin_out[2];
    assign wire_808 = lut_tile_5_3_opin_out[3];
    assign wire_1011 = lut_tile_5_4_opin_out[0];
    assign wire_1012 = lut_tile_5_4_opin_out[1];
    assign wire_1013 = lut_tile_5_4_opin_out[2];
    assign wire_1014 = lut_tile_5_4_opin_out[3];
    assign wire_1217 = lut_tile_5_5_opin_out[0];
    assign wire_1218 = lut_tile_5_5_opin_out[1];
    assign wire_1219 = lut_tile_5_5_opin_out[2];
    assign wire_1220 = lut_tile_5_5_opin_out[3];
    // LUT TILE CHANXY 
    assign lut_tile_1_1_chanxy_in = {wire_1555, wire_1528, wire_2119, wire_1639, wire_1629, wire_1628, wire_1615, wire_1614, wire_1601, wire_1600, wire_1594, wire_1527, wire_1526, wire_1549, wire_1548, wire_1525, wire_1524, wire_1523, wire_1522, wire_2117, wire_1631, wire_1626, wire_1621, wire_1620, wire_1607, wire_1606, wire_1593, wire_1592, wire_511, wire_1547, wire_1546, wire_1553, wire_1520, wire_1519, wire_1518, wire_1517, wire_1516, wire_2115, wire_1633, wire_1625, wire_1624, wire_1618, wire_1613, wire_1612, wire_1599, wire_1598, wire_511, wire_1559, wire_1544, wire_1543, wire_1542, wire_1515, wire_1514, wire_1541, wire_1540, wire_2113, wire_1635, wire_1617, wire_1616, wire_1610, wire_1605, wire_1604, wire_1591, wire_1590, wire_307, wire_1539, wire_1538, wire_1551, wire_1512, wire_1557, wire_1536, wire_1535, wire_1534, wire_511, wire_2111, wire_1637, wire_1623, wire_1622, wire_1609, wire_1608, wire_1602, wire_1597, wire_1596, wire_307, wire_1511, wire_1510, wire_511, wire_1533, wire_1532, wire_307, wire_1531, wire_1530, wire_307, wire_2035, wire_2008, wire_2113, wire_2109, wire_2108, wire_2098, wire_2095, wire_2094, wire_2081, wire_2080, wire_1639, wire_2007, wire_2006, wire_2029, wire_2028, wire_2005, wire_2004, wire_2003, wire_2002, wire_2115, wire_2101, wire_2100, wire_2090, wire_2087, wire_2086, wire_2073, wire_2072, wire_1637, wire_330, wire_2027, wire_2026, wire_2033, wire_2000, wire_1999, wire_1998, wire_1997, wire_1996, wire_2117, wire_2105, wire_2104, wire_2093, wire_2092, wire_2082, wire_2079, wire_2078, wire_1635, wire_330, wire_2039, wire_2024, wire_2023, wire_2022, wire_1995, wire_1994, wire_2021, wire_2020, wire_2119, wire_2097, wire_2096, wire_2085, wire_2084, wire_2074, wire_2071, wire_2070, wire_1633, wire_306, wire_2019, wire_2018, wire_2031, wire_1992, wire_2037, wire_2016, wire_2015, wire_2014, wire_330, wire_2111, wire_2106, wire_2103, wire_2102, wire_2089, wire_2088, wire_2077, wire_2076, wire_1631, wire_306, wire_1991, wire_1990, wire_330, wire_2013, wire_2012, wire_306, wire_2011, wire_2010, wire_306};
    // CHNAXY TOTAL: 186
    assign wire_1590 = lut_tile_1_1_chanxy_out[0];
    assign wire_1592 = lut_tile_1_1_chanxy_out[1];
    assign wire_1594 = lut_tile_1_1_chanxy_out[2];
    assign wire_1595 = lut_tile_1_1_chanxy_out[3];
    assign wire_1596 = lut_tile_1_1_chanxy_out[4];
    assign wire_1598 = lut_tile_1_1_chanxy_out[5];
    assign wire_1600 = lut_tile_1_1_chanxy_out[6];
    assign wire_1602 = lut_tile_1_1_chanxy_out[7];
    assign wire_1603 = lut_tile_1_1_chanxy_out[8];
    assign wire_1604 = lut_tile_1_1_chanxy_out[9];
    assign wire_1606 = lut_tile_1_1_chanxy_out[10];
    assign wire_1608 = lut_tile_1_1_chanxy_out[11];
    assign wire_1610 = lut_tile_1_1_chanxy_out[12];
    assign wire_1611 = lut_tile_1_1_chanxy_out[13];
    assign wire_1612 = lut_tile_1_1_chanxy_out[14];
    assign wire_1614 = lut_tile_1_1_chanxy_out[15];
    assign wire_1616 = lut_tile_1_1_chanxy_out[16];
    assign wire_1618 = lut_tile_1_1_chanxy_out[17];
    assign wire_1619 = lut_tile_1_1_chanxy_out[18];
    assign wire_1620 = lut_tile_1_1_chanxy_out[19];
    assign wire_1622 = lut_tile_1_1_chanxy_out[20];
    assign wire_1624 = lut_tile_1_1_chanxy_out[21];
    assign wire_1626 = lut_tile_1_1_chanxy_out[22];
    assign wire_1627 = lut_tile_1_1_chanxy_out[23];
    assign wire_1628 = lut_tile_1_1_chanxy_out[24];
    assign wire_2070 = lut_tile_1_1_chanxy_out[25];
    assign wire_2072 = lut_tile_1_1_chanxy_out[26];
    assign wire_2074 = lut_tile_1_1_chanxy_out[27];
    assign wire_2075 = lut_tile_1_1_chanxy_out[28];
    assign wire_2076 = lut_tile_1_1_chanxy_out[29];
    assign wire_2078 = lut_tile_1_1_chanxy_out[30];
    assign wire_2080 = lut_tile_1_1_chanxy_out[31];
    assign wire_2082 = lut_tile_1_1_chanxy_out[32];
    assign wire_2083 = lut_tile_1_1_chanxy_out[33];
    assign wire_2084 = lut_tile_1_1_chanxy_out[34];
    assign wire_2086 = lut_tile_1_1_chanxy_out[35];
    assign wire_2088 = lut_tile_1_1_chanxy_out[36];
    assign wire_2090 = lut_tile_1_1_chanxy_out[37];
    assign wire_2091 = lut_tile_1_1_chanxy_out[38];
    assign wire_2092 = lut_tile_1_1_chanxy_out[39];
    assign wire_2094 = lut_tile_1_1_chanxy_out[40];
    assign wire_2096 = lut_tile_1_1_chanxy_out[41];
    assign wire_2098 = lut_tile_1_1_chanxy_out[42];
    assign wire_2099 = lut_tile_1_1_chanxy_out[43];
    assign wire_2100 = lut_tile_1_1_chanxy_out[44];
    assign wire_2102 = lut_tile_1_1_chanxy_out[45];
    assign wire_2104 = lut_tile_1_1_chanxy_out[46];
    assign wire_2106 = lut_tile_1_1_chanxy_out[47];
    assign wire_2107 = lut_tile_1_1_chanxy_out[48];
    assign wire_2108 = lut_tile_1_1_chanxy_out[49];
   // CHANXY OUT
    assign lut_tile_1_2_chanxy_in = {wire_2199, wire_1649, wire_1637, wire_1636, wire_1607, wire_1606, wire_1596, wire_1593, wire_1592, wire_1555, wire_1554, wire_1527, wire_1526, wire_1549, wire_1548, wire_1525, wire_1524, wire_2197, wire_1641, wire_1639, wire_1638, wire_1628, wire_1615, wire_1614, wire_1601, wire_1600, wire_717, wire_1563, wire_1522, wire_1569, wire_1546, wire_1553, wire_1552, wire_1519, wire_1518, wire_2195, wire_1643, wire_1635, wire_1634, wire_1625, wire_1624, wire_1620, wire_1599, wire_1598, wire_717, wire_1517, wire_1516, wire_1559, wire_1558, wire_1543, wire_1542, wire_1561, wire_1514, wire_2193, wire_1645, wire_1631, wire_1630, wire_1623, wire_1622, wire_1612, wire_1609, wire_1608, wire_513, wire_1541, wire_1540, wire_1567, wire_1538, wire_1551, wire_1550, wire_1557, wire_1556, wire_2191, wire_1647, wire_1633, wire_1632, wire_1617, wire_1616, wire_1604, wire_1591, wire_1590, wire_513, wire_1535, wire_1534, wire_717, wire_1511, wire_1510, wire_717, wire_1533, wire_1532, wire_513, wire_1565, wire_1530, wire_513, wire_2117, wire_2106, wire_2101, wire_2100, wire_2087, wire_2086, wire_2073, wire_2072, wire_1626, wire_2115, wire_2109, wire_2108, wire_2095, wire_2094, wire_2081, wire_2080, wire_2074, wire_1618, wire_536, wire_2113, wire_2105, wire_2104, wire_2093, wire_2092, wire_2082, wire_2079, wire_2078, wire_1610, wire_536, wire_2111, wire_2103, wire_2102, wire_2090, wire_2089, wire_2088, wire_2077, wire_2076, wire_1602, wire_512, wire_2119, wire_2098, wire_2097, wire_2096, wire_2085, wire_2084, wire_2071, wire_2070, wire_1594, wire_512, wire_2193, wire_2180, wire_2179, wire_2178, wire_2167, wire_2166, wire_2153, wire_2152, wire_1649, wire_2195, wire_2187, wire_2186, wire_2175, wire_2174, wire_2172, wire_2161, wire_2160, wire_1647, wire_536, wire_2197, wire_2185, wire_2184, wire_2171, wire_2170, wire_2164, wire_2159, wire_2158, wire_1645, wire_536, wire_2199, wire_2183, wire_2182, wire_2169, wire_2168, wire_2156, wire_2155, wire_2154, wire_1643, wire_512, wire_2191, wire_2188, wire_2177, wire_2176, wire_2163, wire_2162, wire_2151, wire_2150, wire_1641, wire_512};
    // CHNAXY TOTAL: 191
    assign wire_1597 = lut_tile_1_2_chanxy_out[0];
    assign wire_1605 = lut_tile_1_2_chanxy_out[1];
    assign wire_1613 = lut_tile_1_2_chanxy_out[2];
    assign wire_1621 = lut_tile_1_2_chanxy_out[3];
    assign wire_1629 = lut_tile_1_2_chanxy_out[4];
    assign wire_1630 = lut_tile_1_2_chanxy_out[5];
    assign wire_1632 = lut_tile_1_2_chanxy_out[6];
    assign wire_1634 = lut_tile_1_2_chanxy_out[7];
    assign wire_1636 = lut_tile_1_2_chanxy_out[8];
    assign wire_1638 = lut_tile_1_2_chanxy_out[9];
    assign wire_2150 = lut_tile_1_2_chanxy_out[10];
    assign wire_2152 = lut_tile_1_2_chanxy_out[11];
    assign wire_2154 = lut_tile_1_2_chanxy_out[12];
    assign wire_2156 = lut_tile_1_2_chanxy_out[13];
    assign wire_2157 = lut_tile_1_2_chanxy_out[14];
    assign wire_2158 = lut_tile_1_2_chanxy_out[15];
    assign wire_2160 = lut_tile_1_2_chanxy_out[16];
    assign wire_2162 = lut_tile_1_2_chanxy_out[17];
    assign wire_2164 = lut_tile_1_2_chanxy_out[18];
    assign wire_2165 = lut_tile_1_2_chanxy_out[19];
    assign wire_2166 = lut_tile_1_2_chanxy_out[20];
    assign wire_2168 = lut_tile_1_2_chanxy_out[21];
    assign wire_2170 = lut_tile_1_2_chanxy_out[22];
    assign wire_2172 = lut_tile_1_2_chanxy_out[23];
    assign wire_2173 = lut_tile_1_2_chanxy_out[24];
    assign wire_2174 = lut_tile_1_2_chanxy_out[25];
    assign wire_2176 = lut_tile_1_2_chanxy_out[26];
    assign wire_2178 = lut_tile_1_2_chanxy_out[27];
    assign wire_2180 = lut_tile_1_2_chanxy_out[28];
    assign wire_2181 = lut_tile_1_2_chanxy_out[29];
    assign wire_2182 = lut_tile_1_2_chanxy_out[30];
    assign wire_2184 = lut_tile_1_2_chanxy_out[31];
    assign wire_2186 = lut_tile_1_2_chanxy_out[32];
    assign wire_2188 = lut_tile_1_2_chanxy_out[33];
    assign wire_2189 = lut_tile_1_2_chanxy_out[34];
   // CHANXY OUT
    assign lut_tile_1_3_chanxy_in = {wire_1555, wire_1554, wire_1527, wire_1526, wire_1579, wire_1548, wire_2279, wire_1659, wire_1647, wire_1646, wire_1631, wire_1630, wire_1609, wire_1608, wire_1590, wire_1573, wire_1524, wire_1563, wire_1562, wire_1569, wire_1568, wire_1553, wire_1552, wire_2277, wire_1651, wire_1649, wire_1648, wire_1633, wire_1632, wire_1622, wire_1617, wire_1616, wire_923, wire_1519, wire_1518, wire_1571, wire_1516, wire_1559, wire_1558, wire_1543, wire_1542, wire_2275, wire_1653, wire_1645, wire_1644, wire_1639, wire_1638, wire_1614, wire_1601, wire_1600, wire_923, wire_1561, wire_1560, wire_1577, wire_1540, wire_1567, wire_1566, wire_1551, wire_1550, wire_2273, wire_1655, wire_1641, wire_1640, wire_1635, wire_1634, wire_1625, wire_1624, wire_1606, wire_719, wire_1557, wire_1556, wire_1535, wire_1534, wire_923, wire_1511, wire_1510, wire_923, wire_1575, wire_1532, wire_719, wire_2271, wire_1657, wire_1643, wire_1642, wire_1637, wire_1636, wire_1598, wire_1593, wire_1592, wire_719, wire_1565, wire_1564, wire_719, wire_2197, wire_2188, wire_2183, wire_2182, wire_2169, wire_2168, wire_2155, wire_2154, wire_1628, wire_2195, wire_2179, wire_2178, wire_2167, wire_2166, wire_2156, wire_2153, wire_2152, wire_1620, wire_742, wire_2193, wire_2177, wire_2176, wire_2164, wire_2163, wire_2162, wire_2151, wire_2150, wire_1612, wire_742, wire_2191, wire_2187, wire_2186, wire_2175, wire_2174, wire_2172, wire_2161, wire_2160, wire_1604, wire_718, wire_2199, wire_2185, wire_2184, wire_2180, wire_2171, wire_2170, wire_2159, wire_2158, wire_1596, wire_718, wire_2273, wire_2261, wire_2260, wire_2254, wire_2249, wire_2248, wire_2235, wire_2234, wire_1659, wire_2275, wire_2269, wire_2268, wire_2257, wire_2256, wire_2246, wire_2243, wire_2242, wire_1657, wire_742, wire_2277, wire_2267, wire_2266, wire_2253, wire_2252, wire_2241, wire_2240, wire_2238, wire_1655, wire_742, wire_2279, wire_2265, wire_2264, wire_2251, wire_2250, wire_2237, wire_2236, wire_2230, wire_1653, wire_718, wire_2271, wire_2262, wire_2259, wire_2258, wire_2245, wire_2244, wire_2233, wire_2232, wire_1651, wire_718};
    // CHNAXY TOTAL: 191
    assign wire_1591 = lut_tile_1_3_chanxy_out[0];
    assign wire_1599 = lut_tile_1_3_chanxy_out[1];
    assign wire_1607 = lut_tile_1_3_chanxy_out[2];
    assign wire_1615 = lut_tile_1_3_chanxy_out[3];
    assign wire_1623 = lut_tile_1_3_chanxy_out[4];
    assign wire_1640 = lut_tile_1_3_chanxy_out[5];
    assign wire_1642 = lut_tile_1_3_chanxy_out[6];
    assign wire_1644 = lut_tile_1_3_chanxy_out[7];
    assign wire_1646 = lut_tile_1_3_chanxy_out[8];
    assign wire_1648 = lut_tile_1_3_chanxy_out[9];
    assign wire_2230 = lut_tile_1_3_chanxy_out[10];
    assign wire_2231 = lut_tile_1_3_chanxy_out[11];
    assign wire_2232 = lut_tile_1_3_chanxy_out[12];
    assign wire_2234 = lut_tile_1_3_chanxy_out[13];
    assign wire_2236 = lut_tile_1_3_chanxy_out[14];
    assign wire_2238 = lut_tile_1_3_chanxy_out[15];
    assign wire_2239 = lut_tile_1_3_chanxy_out[16];
    assign wire_2240 = lut_tile_1_3_chanxy_out[17];
    assign wire_2242 = lut_tile_1_3_chanxy_out[18];
    assign wire_2244 = lut_tile_1_3_chanxy_out[19];
    assign wire_2246 = lut_tile_1_3_chanxy_out[20];
    assign wire_2247 = lut_tile_1_3_chanxy_out[21];
    assign wire_2248 = lut_tile_1_3_chanxy_out[22];
    assign wire_2250 = lut_tile_1_3_chanxy_out[23];
    assign wire_2252 = lut_tile_1_3_chanxy_out[24];
    assign wire_2254 = lut_tile_1_3_chanxy_out[25];
    assign wire_2255 = lut_tile_1_3_chanxy_out[26];
    assign wire_2256 = lut_tile_1_3_chanxy_out[27];
    assign wire_2258 = lut_tile_1_3_chanxy_out[28];
    assign wire_2260 = lut_tile_1_3_chanxy_out[29];
    assign wire_2262 = lut_tile_1_3_chanxy_out[30];
    assign wire_2263 = lut_tile_1_3_chanxy_out[31];
    assign wire_2264 = lut_tile_1_3_chanxy_out[32];
    assign wire_2266 = lut_tile_1_3_chanxy_out[33];
    assign wire_2268 = lut_tile_1_3_chanxy_out[34];
   // CHANXY OUT
    assign lut_tile_1_4_chanxy_in = {wire_1555, wire_1554, wire_1585, wire_1526, wire_2359, wire_1669, wire_1659, wire_1658, wire_1641, wire_1640, wire_1635, wire_1634, wire_1592, wire_1579, wire_1578, wire_1573, wire_1572, wire_1563, wire_1562, wire_1569, wire_1568, wire_2357, wire_1661, wire_1655, wire_1654, wire_1647, wire_1646, wire_1631, wire_1630, wire_1624, wire_1129, wire_1553, wire_1552, wire_1583, wire_1518, wire_1571, wire_1570, wire_1559, wire_1558, wire_2355, wire_1663, wire_1651, wire_1650, wire_1643, wire_1642, wire_1637, wire_1636, wire_1616, wire_1129, wire_1589, wire_1542, wire_1561, wire_1560, wire_1577, wire_1576, wire_1567, wire_1566, wire_2353, wire_1665, wire_1657, wire_1656, wire_1649, wire_1648, wire_1633, wire_1632, wire_1608, wire_925, wire_1551, wire_1550, wire_1557, wire_1556, wire_1587, wire_1534, wire_1129, wire_1581, wire_1510, wire_1129, wire_2351, wire_1667, wire_1653, wire_1652, wire_1645, wire_1644, wire_1639, wire_1638, wire_1600, wire_925, wire_1575, wire_1574, wire_925, wire_1565, wire_1564, wire_925, wire_2277, wire_2265, wire_2264, wire_2262, wire_2251, wire_2250, wire_2237, wire_2236, wire_1622, wire_2275, wire_2261, wire_2260, wire_2249, wire_2248, wire_2235, wire_2234, wire_2230, wire_1614, wire_948, wire_2273, wire_2259, wire_2258, wire_2245, wire_2244, wire_2238, wire_2233, wire_2232, wire_1606, wire_948, wire_2271, wire_2269, wire_2268, wire_2257, wire_2256, wire_2246, wire_2243, wire_2242, wire_1598, wire_924, wire_2279, wire_2267, wire_2266, wire_2254, wire_2253, wire_2252, wire_2241, wire_2240, wire_1590, wire_924, wire_2353, wire_2343, wire_2342, wire_2336, wire_2331, wire_2330, wire_2317, wire_2316, wire_1669, wire_2355, wire_2341, wire_2340, wire_2328, wire_2327, wire_2326, wire_2315, wire_2314, wire_1667, wire_948, wire_2357, wire_2339, wire_2338, wire_2325, wire_2324, wire_2320, wire_2311, wire_2310, wire_1665, wire_948, wire_2359, wire_2349, wire_2348, wire_2335, wire_2334, wire_2323, wire_2322, wire_2312, wire_1663, wire_924, wire_2351, wire_2347, wire_2346, wire_2344, wire_2333, wire_2332, wire_2319, wire_2318, wire_1661, wire_924};
    // CHNAXY TOTAL: 191
    assign wire_1593 = lut_tile_1_4_chanxy_out[0];
    assign wire_1601 = lut_tile_1_4_chanxy_out[1];
    assign wire_1609 = lut_tile_1_4_chanxy_out[2];
    assign wire_1617 = lut_tile_1_4_chanxy_out[3];
    assign wire_1625 = lut_tile_1_4_chanxy_out[4];
    assign wire_1650 = lut_tile_1_4_chanxy_out[5];
    assign wire_1652 = lut_tile_1_4_chanxy_out[6];
    assign wire_1654 = lut_tile_1_4_chanxy_out[7];
    assign wire_1656 = lut_tile_1_4_chanxy_out[8];
    assign wire_1658 = lut_tile_1_4_chanxy_out[9];
    assign wire_2310 = lut_tile_1_4_chanxy_out[10];
    assign wire_2312 = lut_tile_1_4_chanxy_out[11];
    assign wire_2313 = lut_tile_1_4_chanxy_out[12];
    assign wire_2314 = lut_tile_1_4_chanxy_out[13];
    assign wire_2316 = lut_tile_1_4_chanxy_out[14];
    assign wire_2318 = lut_tile_1_4_chanxy_out[15];
    assign wire_2320 = lut_tile_1_4_chanxy_out[16];
    assign wire_2321 = lut_tile_1_4_chanxy_out[17];
    assign wire_2322 = lut_tile_1_4_chanxy_out[18];
    assign wire_2324 = lut_tile_1_4_chanxy_out[19];
    assign wire_2326 = lut_tile_1_4_chanxy_out[20];
    assign wire_2328 = lut_tile_1_4_chanxy_out[21];
    assign wire_2329 = lut_tile_1_4_chanxy_out[22];
    assign wire_2330 = lut_tile_1_4_chanxy_out[23];
    assign wire_2332 = lut_tile_1_4_chanxy_out[24];
    assign wire_2334 = lut_tile_1_4_chanxy_out[25];
    assign wire_2336 = lut_tile_1_4_chanxy_out[26];
    assign wire_2337 = lut_tile_1_4_chanxy_out[27];
    assign wire_2338 = lut_tile_1_4_chanxy_out[28];
    assign wire_2340 = lut_tile_1_4_chanxy_out[29];
    assign wire_2342 = lut_tile_1_4_chanxy_out[30];
    assign wire_2344 = lut_tile_1_4_chanxy_out[31];
    assign wire_2345 = lut_tile_1_4_chanxy_out[32];
    assign wire_2346 = lut_tile_1_4_chanxy_out[33];
    assign wire_2348 = lut_tile_1_4_chanxy_out[34];
   // CHANXY OUT
    assign lut_tile_1_5_chanxy_in = {wire_1550, wire_2439, wire_1664, wire_1652, wire_1648, wire_1636, wire_1313, wire_1304, wire_1298, wire_1560, wire_1570, wire_1316, wire_1582, wire_1316, wire_1552, wire_1313, wire_2437, wire_1666, wire_1654, wire_1640, wire_1638, wire_1310, wire_1304, wire_1295, wire_1562, wire_1313, wire_1572, wire_1310, wire_1584, wire_1310, wire_1554, wire_1307, wire_2435, wire_1668, wire_1656, wire_1642, wire_1630, wire_1316, wire_1310, wire_1301, wire_1295, wire_1564, wire_1307, wire_1574, wire_1304, wire_1586, wire_1304, wire_1556, wire_1301, wire_2433, wire_1660, wire_1658, wire_1644, wire_1632, wire_1316, wire_1307, wire_1301, wire_1131, wire_1566, wire_1301, wire_1576, wire_1298, wire_1588, wire_1298, wire_1558, wire_1295, wire_2431, wire_1662, wire_1650, wire_1646, wire_1634, wire_1313, wire_1307, wire_1298, wire_1131, wire_1568, wire_1295, wire_1578, wire_1131, wire_1580, wire_1131, wire_2405, wire_2404, wire_2357, wire_2349, wire_2348, wire_2344, wire_2335, wire_2334, wire_2323, wire_2322, wire_1624, wire_2399, wire_2398, wire_2355, wire_2341, wire_2340, wire_2327, wire_2326, wire_2315, wire_2314, wire_2312, wire_1616, wire_1154, wire_2397, wire_2396, wire_2353, wire_2347, wire_2346, wire_2333, wire_2332, wire_2320, wire_2319, wire_2318, wire_1608, wire_1154, wire_2415, wire_2414, wire_2351, wire_2339, wire_2338, wire_2328, wire_2325, wire_2324, wire_2311, wire_2310, wire_1600, wire_1130, wire_2409, wire_2408, wire_1130, wire_2359, wire_2343, wire_2342, wire_2336, wire_2331, wire_2330, wire_2317, wire_2316, wire_1592, wire_1130, wire_2433, wire_2402, wire_2425, wire_2424, wire_2437, wire_2418, wire_2413, wire_2412, wire_2391, wire_2390, wire_1130, wire_2407, wire_2406, wire_2439, wire_2426, wire_2423, wire_2422, wire_2417, wire_2416, wire_2393, wire_2392, wire_1154, wire_2429, wire_2428, wire_2401, wire_2400, wire_2421, wire_2420, wire_2431, wire_2394, wire_2435, wire_2410, wire_1154};
    // CHNAXY TOTAL: 174
    assign wire_1631 = lut_tile_1_5_chanxy_out[0];
    assign wire_1633 = lut_tile_1_5_chanxy_out[1];
    assign wire_1635 = lut_tile_1_5_chanxy_out[2];
    assign wire_1637 = lut_tile_1_5_chanxy_out[3];
    assign wire_1639 = lut_tile_1_5_chanxy_out[4];
    assign wire_1641 = lut_tile_1_5_chanxy_out[5];
    assign wire_1643 = lut_tile_1_5_chanxy_out[6];
    assign wire_1645 = lut_tile_1_5_chanxy_out[7];
    assign wire_1647 = lut_tile_1_5_chanxy_out[8];
    assign wire_1649 = lut_tile_1_5_chanxy_out[9];
    assign wire_1651 = lut_tile_1_5_chanxy_out[10];
    assign wire_1653 = lut_tile_1_5_chanxy_out[11];
    assign wire_1655 = lut_tile_1_5_chanxy_out[12];
    assign wire_1657 = lut_tile_1_5_chanxy_out[13];
    assign wire_1659 = lut_tile_1_5_chanxy_out[14];
    assign wire_1660 = lut_tile_1_5_chanxy_out[15];
    assign wire_1661 = lut_tile_1_5_chanxy_out[16];
    assign wire_1662 = lut_tile_1_5_chanxy_out[17];
    assign wire_1663 = lut_tile_1_5_chanxy_out[18];
    assign wire_1664 = lut_tile_1_5_chanxy_out[19];
    assign wire_1665 = lut_tile_1_5_chanxy_out[20];
    assign wire_1666 = lut_tile_1_5_chanxy_out[21];
    assign wire_1667 = lut_tile_1_5_chanxy_out[22];
    assign wire_1668 = lut_tile_1_5_chanxy_out[23];
    assign wire_1669 = lut_tile_1_5_chanxy_out[24];
    assign wire_2390 = lut_tile_1_5_chanxy_out[25];
    assign wire_2392 = lut_tile_1_5_chanxy_out[26];
    assign wire_2394 = lut_tile_1_5_chanxy_out[27];
    assign wire_2395 = lut_tile_1_5_chanxy_out[28];
    assign wire_2396 = lut_tile_1_5_chanxy_out[29];
    assign wire_2398 = lut_tile_1_5_chanxy_out[30];
    assign wire_2400 = lut_tile_1_5_chanxy_out[31];
    assign wire_2402 = lut_tile_1_5_chanxy_out[32];
    assign wire_2403 = lut_tile_1_5_chanxy_out[33];
    assign wire_2404 = lut_tile_1_5_chanxy_out[34];
    assign wire_2406 = lut_tile_1_5_chanxy_out[35];
    assign wire_2408 = lut_tile_1_5_chanxy_out[36];
    assign wire_2410 = lut_tile_1_5_chanxy_out[37];
    assign wire_2411 = lut_tile_1_5_chanxy_out[38];
    assign wire_2412 = lut_tile_1_5_chanxy_out[39];
    assign wire_2414 = lut_tile_1_5_chanxy_out[40];
    assign wire_2416 = lut_tile_1_5_chanxy_out[41];
    assign wire_2418 = lut_tile_1_5_chanxy_out[42];
    assign wire_2419 = lut_tile_1_5_chanxy_out[43];
    assign wire_2420 = lut_tile_1_5_chanxy_out[44];
    assign wire_2422 = lut_tile_1_5_chanxy_out[45];
    assign wire_2424 = lut_tile_1_5_chanxy_out[46];
    assign wire_2426 = lut_tile_1_5_chanxy_out[47];
    assign wire_2427 = lut_tile_1_5_chanxy_out[48];
    assign wire_2428 = lut_tile_1_5_chanxy_out[49];
   // CHANXY OUT
    assign lut_tile_2_1_chanxy_in = {wire_2106, wire_1631, wire_1621, wire_1620, wire_1607, wire_1606, wire_1602, wire_1593, wire_1592, wire_2098, wire_1639, wire_1629, wire_1628, wire_1615, wire_1614, wire_1610, wire_1601, wire_1600, wire_533, wire_2090, wire_1637, wire_1625, wire_1624, wire_1618, wire_1613, wire_1612, wire_1599, wire_1598, wire_533, wire_2082, wire_1635, wire_1626, wire_1623, wire_1622, wire_1609, wire_1608, wire_1597, wire_1596, wire_329, wire_2074, wire_1633, wire_1617, wire_1616, wire_1605, wire_1604, wire_1594, wire_1591, wire_1590, wire_329, wire_2129, wire_1719, wire_1699, wire_1698, wire_1687, wire_1686, wire_1676, wire_1673, wire_1672, wire_2127, wire_1711, wire_1708, wire_1707, wire_1706, wire_1695, wire_1694, wire_1681, wire_1680, wire_533, wire_2125, wire_1713, wire_1705, wire_1704, wire_1700, wire_1691, wire_1690, wire_1679, wire_1678, wire_533, wire_2123, wire_1715, wire_1703, wire_1702, wire_1692, wire_1689, wire_1688, wire_1675, wire_1674, wire_329, wire_2121, wire_1717, wire_1697, wire_1696, wire_1684, wire_1683, wire_1682, wire_1671, wire_1670, wire_329, wire_2123, wire_2117, wire_2116, wire_2100, wire_2087, wire_2086, wire_2073, wire_2072, wire_1719, wire_2035, wire_2034, wire_2007, wire_2006, wire_2029, wire_2028, wire_2005, wire_2004, wire_2125, wire_2119, wire_2118, wire_2095, wire_2094, wire_2092, wire_2081, wire_2080, wire_1717, wire_352, wire_2043, wire_2002, wire_2049, wire_2026, wire_2033, wire_2032, wire_1999, wire_1998, wire_2127, wire_2115, wire_2114, wire_2105, wire_2104, wire_2084, wire_2079, wire_2078, wire_1715, wire_352, wire_1997, wire_1996, wire_2039, wire_2038, wire_2023, wire_2022, wire_2041, wire_1994, wire_2129, wire_2111, wire_2110, wire_2103, wire_2102, wire_2089, wire_2088, wire_2076, wire_1713, wire_328, wire_2021, wire_2020, wire_2047, wire_2018, wire_2031, wire_2030, wire_2037, wire_2036, wire_2121, wire_2113, wire_2112, wire_2108, wire_2097, wire_2096, wire_2071, wire_2070, wire_1711, wire_328, wire_2015, wire_2014, wire_352, wire_1991, wire_1990, wire_352, wire_2013, wire_2012, wire_328, wire_2045, wire_2010, wire_328};
    // CHNAXY TOTAL: 191
    assign wire_1670 = lut_tile_2_1_chanxy_out[0];
    assign wire_1672 = lut_tile_2_1_chanxy_out[1];
    assign wire_1674 = lut_tile_2_1_chanxy_out[2];
    assign wire_1676 = lut_tile_2_1_chanxy_out[3];
    assign wire_1677 = lut_tile_2_1_chanxy_out[4];
    assign wire_1678 = lut_tile_2_1_chanxy_out[5];
    assign wire_1680 = lut_tile_2_1_chanxy_out[6];
    assign wire_1682 = lut_tile_2_1_chanxy_out[7];
    assign wire_1684 = lut_tile_2_1_chanxy_out[8];
    assign wire_1685 = lut_tile_2_1_chanxy_out[9];
    assign wire_1686 = lut_tile_2_1_chanxy_out[10];
    assign wire_1688 = lut_tile_2_1_chanxy_out[11];
    assign wire_1690 = lut_tile_2_1_chanxy_out[12];
    assign wire_1692 = lut_tile_2_1_chanxy_out[13];
    assign wire_1693 = lut_tile_2_1_chanxy_out[14];
    assign wire_1694 = lut_tile_2_1_chanxy_out[15];
    assign wire_1696 = lut_tile_2_1_chanxy_out[16];
    assign wire_1698 = lut_tile_2_1_chanxy_out[17];
    assign wire_1700 = lut_tile_2_1_chanxy_out[18];
    assign wire_1701 = lut_tile_2_1_chanxy_out[19];
    assign wire_1702 = lut_tile_2_1_chanxy_out[20];
    assign wire_1704 = lut_tile_2_1_chanxy_out[21];
    assign wire_1706 = lut_tile_2_1_chanxy_out[22];
    assign wire_1708 = lut_tile_2_1_chanxy_out[23];
    assign wire_1709 = lut_tile_2_1_chanxy_out[24];
    assign wire_2077 = lut_tile_2_1_chanxy_out[25];
    assign wire_2085 = lut_tile_2_1_chanxy_out[26];
    assign wire_2093 = lut_tile_2_1_chanxy_out[27];
    assign wire_2101 = lut_tile_2_1_chanxy_out[28];
    assign wire_2109 = lut_tile_2_1_chanxy_out[29];
    assign wire_2110 = lut_tile_2_1_chanxy_out[30];
    assign wire_2112 = lut_tile_2_1_chanxy_out[31];
    assign wire_2114 = lut_tile_2_1_chanxy_out[32];
    assign wire_2116 = lut_tile_2_1_chanxy_out[33];
    assign wire_2118 = lut_tile_2_1_chanxy_out[34];
   // CHANXY OUT
    assign lut_tile_2_2_chanxy_in = {wire_2188, wire_1641, wire_1631, wire_1630, wire_1623, wire_1622, wire_1609, wire_1608, wire_1604, wire_2180, wire_1649, wire_1637, wire_1636, wire_1612, wire_1607, wire_1606, wire_1593, wire_1592, wire_739, wire_2172, wire_1647, wire_1633, wire_1632, wire_1620, wire_1617, wire_1616, wire_1591, wire_1590, wire_739, wire_2164, wire_1645, wire_1639, wire_1638, wire_1628, wire_1615, wire_1614, wire_1601, wire_1600, wire_535, wire_2156, wire_1643, wire_1635, wire_1634, wire_1625, wire_1624, wire_1599, wire_1598, wire_1596, wire_535, wire_2209, wire_1729, wire_1717, wire_1716, wire_1689, wire_1688, wire_1675, wire_1674, wire_1670, wire_2207, wire_1721, wire_1719, wire_1718, wire_1702, wire_1697, wire_1696, wire_1683, wire_1682, wire_739, wire_2205, wire_1723, wire_1715, wire_1714, wire_1707, wire_1706, wire_1694, wire_1681, wire_1680, wire_739, wire_2203, wire_1725, wire_1711, wire_1710, wire_1705, wire_1704, wire_1691, wire_1690, wire_1686, wire_535, wire_2201, wire_1727, wire_1713, wire_1712, wire_1699, wire_1698, wire_1678, wire_1673, wire_1672, wire_535, wire_2127, wire_2111, wire_2110, wire_2108, wire_2103, wire_2102, wire_2089, wire_2088, wire_1708, wire_2125, wire_2117, wire_2116, wire_2087, wire_2086, wire_2076, wire_2073, wire_2072, wire_1700, wire_558, wire_2123, wire_2113, wire_2112, wire_2097, wire_2096, wire_2084, wire_2071, wire_2070, wire_1692, wire_558, wire_2121, wire_2119, wire_2118, wire_2095, wire_2094, wire_2092, wire_2081, wire_2080, wire_1684, wire_534, wire_2129, wire_2115, wire_2114, wire_2105, wire_2104, wire_2100, wire_2079, wire_2078, wire_1676, wire_534, wire_2203, wire_2197, wire_2196, wire_2174, wire_2169, wire_2168, wire_2155, wire_2154, wire_1729, wire_2205, wire_2199, wire_2198, wire_2177, wire_2176, wire_2166, wire_2163, wire_2162, wire_1727, wire_558, wire_2207, wire_2195, wire_2194, wire_2187, wire_2186, wire_2161, wire_2160, wire_2158, wire_1725, wire_558, wire_2209, wire_2191, wire_2190, wire_2185, wire_2184, wire_2171, wire_2170, wire_2150, wire_1723, wire_534, wire_2201, wire_2193, wire_2192, wire_2182, wire_2179, wire_2178, wire_2153, wire_2152, wire_1721, wire_534};
    // CHNAXY TOTAL: 196
    assign wire_1671 = lut_tile_2_2_chanxy_out[0];
    assign wire_1679 = lut_tile_2_2_chanxy_out[1];
    assign wire_1687 = lut_tile_2_2_chanxy_out[2];
    assign wire_1695 = lut_tile_2_2_chanxy_out[3];
    assign wire_1703 = lut_tile_2_2_chanxy_out[4];
    assign wire_1710 = lut_tile_2_2_chanxy_out[5];
    assign wire_1712 = lut_tile_2_2_chanxy_out[6];
    assign wire_1714 = lut_tile_2_2_chanxy_out[7];
    assign wire_1716 = lut_tile_2_2_chanxy_out[8];
    assign wire_1718 = lut_tile_2_2_chanxy_out[9];
    assign wire_2151 = lut_tile_2_2_chanxy_out[10];
    assign wire_2159 = lut_tile_2_2_chanxy_out[11];
    assign wire_2167 = lut_tile_2_2_chanxy_out[12];
    assign wire_2175 = lut_tile_2_2_chanxy_out[13];
    assign wire_2183 = lut_tile_2_2_chanxy_out[14];
    assign wire_2190 = lut_tile_2_2_chanxy_out[15];
    assign wire_2192 = lut_tile_2_2_chanxy_out[16];
    assign wire_2194 = lut_tile_2_2_chanxy_out[17];
    assign wire_2196 = lut_tile_2_2_chanxy_out[18];
    assign wire_2198 = lut_tile_2_2_chanxy_out[19];
   // CHANXY OUT
    assign lut_tile_2_3_chanxy_in = {wire_2262, wire_1651, wire_1641, wire_1640, wire_1635, wire_1634, wire_1625, wire_1624, wire_1598, wire_2254, wire_1659, wire_1647, wire_1646, wire_1631, wire_1630, wire_1609, wire_1608, wire_1606, wire_945, wire_2246, wire_1657, wire_1643, wire_1642, wire_1637, wire_1636, wire_1614, wire_1593, wire_1592, wire_945, wire_2238, wire_1655, wire_1649, wire_1648, wire_1633, wire_1632, wire_1622, wire_1617, wire_1616, wire_741, wire_2230, wire_1653, wire_1645, wire_1644, wire_1639, wire_1638, wire_1601, wire_1600, wire_1590, wire_741, wire_2289, wire_1739, wire_1729, wire_1728, wire_1711, wire_1710, wire_1691, wire_1690, wire_1672, wire_2287, wire_1731, wire_1725, wire_1724, wire_1717, wire_1716, wire_1704, wire_1675, wire_1674, wire_945, wire_2285, wire_1733, wire_1721, wire_1720, wire_1713, wire_1712, wire_1699, wire_1698, wire_1696, wire_945, wire_2283, wire_1735, wire_1727, wire_1726, wire_1719, wire_1718, wire_1688, wire_1683, wire_1682, wire_741, wire_2281, wire_1737, wire_1723, wire_1722, wire_1715, wire_1714, wire_1707, wire_1706, wire_1680, wire_741, wire_2207, wire_2191, wire_2190, wire_2185, wire_2184, wire_2182, wire_2171, wire_2170, wire_1702, wire_2205, wire_2197, wire_2196, wire_2169, wire_2168, wire_2155, wire_2154, wire_2150, wire_1694, wire_764, wire_2203, wire_2193, wire_2192, wire_2179, wire_2178, wire_2158, wire_2153, wire_2152, wire_1686, wire_764, wire_2201, wire_2199, wire_2198, wire_2177, wire_2176, wire_2166, wire_2163, wire_2162, wire_1678, wire_740, wire_2209, wire_2195, wire_2194, wire_2187, wire_2186, wire_2174, wire_2161, wire_2160, wire_1670, wire_740, wire_2283, wire_2279, wire_2278, wire_2256, wire_2251, wire_2250, wire_2237, wire_2236, wire_1739, wire_2285, wire_2275, wire_2274, wire_2261, wire_2260, wire_2248, wire_2235, wire_2234, wire_1737, wire_764, wire_2287, wire_2271, wire_2270, wire_2259, wire_2258, wire_2245, wire_2244, wire_2240, wire_1735, wire_764, wire_2289, wire_2277, wire_2276, wire_2269, wire_2268, wire_2243, wire_2242, wire_2232, wire_1733, wire_740, wire_2281, wire_2273, wire_2272, wire_2267, wire_2266, wire_2264, wire_2253, wire_2252, wire_1731, wire_740};
    // CHNAXY TOTAL: 196
    assign wire_1673 = lut_tile_2_3_chanxy_out[0];
    assign wire_1681 = lut_tile_2_3_chanxy_out[1];
    assign wire_1689 = lut_tile_2_3_chanxy_out[2];
    assign wire_1697 = lut_tile_2_3_chanxy_out[3];
    assign wire_1705 = lut_tile_2_3_chanxy_out[4];
    assign wire_1720 = lut_tile_2_3_chanxy_out[5];
    assign wire_1722 = lut_tile_2_3_chanxy_out[6];
    assign wire_1724 = lut_tile_2_3_chanxy_out[7];
    assign wire_1726 = lut_tile_2_3_chanxy_out[8];
    assign wire_1728 = lut_tile_2_3_chanxy_out[9];
    assign wire_2233 = lut_tile_2_3_chanxy_out[10];
    assign wire_2241 = lut_tile_2_3_chanxy_out[11];
    assign wire_2249 = lut_tile_2_3_chanxy_out[12];
    assign wire_2257 = lut_tile_2_3_chanxy_out[13];
    assign wire_2265 = lut_tile_2_3_chanxy_out[14];
    assign wire_2270 = lut_tile_2_3_chanxy_out[15];
    assign wire_2272 = lut_tile_2_3_chanxy_out[16];
    assign wire_2274 = lut_tile_2_3_chanxy_out[17];
    assign wire_2276 = lut_tile_2_3_chanxy_out[18];
    assign wire_2278 = lut_tile_2_3_chanxy_out[19];
   // CHANXY OUT
    assign lut_tile_2_4_chanxy_in = {wire_2344, wire_1661, wire_1657, wire_1656, wire_1649, wire_1648, wire_1633, wire_1632, wire_1600, wire_2336, wire_1669, wire_1655, wire_1654, wire_1647, wire_1646, wire_1631, wire_1630, wire_1608, wire_1151, wire_2328, wire_1667, wire_1653, wire_1652, wire_1645, wire_1644, wire_1639, wire_1638, wire_1616, wire_1151, wire_2320, wire_1665, wire_1651, wire_1650, wire_1643, wire_1642, wire_1637, wire_1636, wire_1624, wire_947, wire_2312, wire_1663, wire_1659, wire_1658, wire_1641, wire_1640, wire_1635, wire_1634, wire_1592, wire_947, wire_2369, wire_1749, wire_1733, wire_1732, wire_1727, wire_1726, wire_1719, wire_1718, wire_1674, wire_2367, wire_1741, wire_1731, wire_1730, wire_1725, wire_1724, wire_1717, wire_1716, wire_1706, wire_1151, wire_2365, wire_1743, wire_1739, wire_1738, wire_1723, wire_1722, wire_1715, wire_1714, wire_1698, wire_1151, wire_2363, wire_1745, wire_1737, wire_1736, wire_1721, wire_1720, wire_1713, wire_1712, wire_1690, wire_947, wire_2361, wire_1747, wire_1735, wire_1734, wire_1729, wire_1728, wire_1711, wire_1710, wire_1682, wire_947, wire_2287, wire_2277, wire_2276, wire_2269, wire_2268, wire_2264, wire_2243, wire_2242, wire_1704, wire_2285, wire_2275, wire_2274, wire_2261, wire_2260, wire_2235, wire_2234, wire_2232, wire_1696, wire_970, wire_2283, wire_2273, wire_2272, wire_2267, wire_2266, wire_2253, wire_2252, wire_2240, wire_1688, wire_970, wire_2281, wire_2271, wire_2270, wire_2259, wire_2258, wire_2248, wire_2245, wire_2244, wire_1680, wire_946, wire_2289, wire_2279, wire_2278, wire_2256, wire_2251, wire_2250, wire_2237, wire_2236, wire_1672, wire_946, wire_2363, wire_2353, wire_2352, wire_2349, wire_2348, wire_2338, wire_2335, wire_2334, wire_1749, wire_2365, wire_2351, wire_2350, wire_2341, wire_2340, wire_2330, wire_2327, wire_2326, wire_1747, wire_970, wire_2367, wire_2359, wire_2358, wire_2333, wire_2332, wire_2322, wire_2319, wire_2318, wire_1745, wire_970, wire_2369, wire_2357, wire_2356, wire_2325, wire_2324, wire_2314, wire_2311, wire_2310, wire_1743, wire_946, wire_2361, wire_2355, wire_2354, wire_2346, wire_2343, wire_2342, wire_2317, wire_2316, wire_1741, wire_946};
    // CHNAXY TOTAL: 196
    assign wire_1675 = lut_tile_2_4_chanxy_out[0];
    assign wire_1683 = lut_tile_2_4_chanxy_out[1];
    assign wire_1691 = lut_tile_2_4_chanxy_out[2];
    assign wire_1699 = lut_tile_2_4_chanxy_out[3];
    assign wire_1707 = lut_tile_2_4_chanxy_out[4];
    assign wire_1730 = lut_tile_2_4_chanxy_out[5];
    assign wire_1732 = lut_tile_2_4_chanxy_out[6];
    assign wire_1734 = lut_tile_2_4_chanxy_out[7];
    assign wire_1736 = lut_tile_2_4_chanxy_out[8];
    assign wire_1738 = lut_tile_2_4_chanxy_out[9];
    assign wire_2315 = lut_tile_2_4_chanxy_out[10];
    assign wire_2323 = lut_tile_2_4_chanxy_out[11];
    assign wire_2331 = lut_tile_2_4_chanxy_out[12];
    assign wire_2339 = lut_tile_2_4_chanxy_out[13];
    assign wire_2347 = lut_tile_2_4_chanxy_out[14];
    assign wire_2350 = lut_tile_2_4_chanxy_out[15];
    assign wire_2352 = lut_tile_2_4_chanxy_out[16];
    assign wire_2354 = lut_tile_2_4_chanxy_out[17];
    assign wire_2356 = lut_tile_2_4_chanxy_out[18];
    assign wire_2358 = lut_tile_2_4_chanxy_out[19];
   // CHANXY OUT
    assign lut_tile_2_5_chanxy_in = {wire_2426, wire_1664, wire_1652, wire_1648, wire_1636, wire_1361, wire_1352, wire_1346, wire_2418, wire_1666, wire_1654, wire_1640, wire_1638, wire_1358, wire_1352, wire_1343, wire_2410, wire_1668, wire_1656, wire_1642, wire_1630, wire_1364, wire_1358, wire_1349, wire_1343, wire_2402, wire_1660, wire_1658, wire_1644, wire_1632, wire_1364, wire_1355, wire_1349, wire_1153, wire_2394, wire_1662, wire_1650, wire_1646, wire_1634, wire_1361, wire_1355, wire_1346, wire_1153, wire_2449, wire_1746, wire_1734, wire_1722, wire_1718, wire_1361, wire_1352, wire_1346, wire_2447, wire_1748, wire_1736, wire_1724, wire_1710, wire_1358, wire_1352, wire_1343, wire_2445, wire_1740, wire_1738, wire_1726, wire_1712, wire_1364, wire_1358, wire_1349, wire_1343, wire_2443, wire_1742, wire_1730, wire_1728, wire_1714, wire_1364, wire_1355, wire_1349, wire_1153, wire_2441, wire_1744, wire_1732, wire_1720, wire_1716, wire_1361, wire_1355, wire_1346, wire_1153, wire_2449, wire_2428, wire_2367, wire_2351, wire_2350, wire_2346, wire_2341, wire_2340, wire_2327, wire_2326, wire_1706, wire_2401, wire_2400, wire_2365, wire_2353, wire_2352, wire_2349, wire_2348, wire_2335, wire_2334, wire_2314, wire_1698, wire_1176, wire_2447, wire_2420, wire_2363, wire_2359, wire_2358, wire_2333, wire_2332, wire_2322, wire_2319, wire_2318, wire_1690, wire_1176, wire_2431, wire_2430, wire_2361, wire_2355, wire_2354, wire_2343, wire_2342, wire_2330, wire_2317, wire_2316, wire_1682, wire_1152, wire_2435, wire_2434, wire_1176, wire_2369, wire_2357, wire_2356, wire_2338, wire_2325, wire_2324, wire_2311, wire_2310, wire_1674, wire_1152, wire_2443, wire_2404, wire_2399, wire_2398, wire_2441, wire_2396, wire_2415, wire_2414, wire_2409, wire_2408, wire_1152, wire_2433, wire_2432, wire_2425, wire_2424, wire_2437, wire_2436, wire_2445, wire_2412, wire_2391, wire_2390, wire_1152, wire_2407, wire_2406, wire_2439, wire_2438, wire_2423, wire_2422, wire_2417, wire_2416, wire_2393, wire_2392, wire_1176};
    // CHNAXY TOTAL: 179
    assign wire_1711 = lut_tile_2_5_chanxy_out[0];
    assign wire_1713 = lut_tile_2_5_chanxy_out[1];
    assign wire_1715 = lut_tile_2_5_chanxy_out[2];
    assign wire_1717 = lut_tile_2_5_chanxy_out[3];
    assign wire_1719 = lut_tile_2_5_chanxy_out[4];
    assign wire_1721 = lut_tile_2_5_chanxy_out[5];
    assign wire_1723 = lut_tile_2_5_chanxy_out[6];
    assign wire_1725 = lut_tile_2_5_chanxy_out[7];
    assign wire_1727 = lut_tile_2_5_chanxy_out[8];
    assign wire_1729 = lut_tile_2_5_chanxy_out[9];
    assign wire_1731 = lut_tile_2_5_chanxy_out[10];
    assign wire_1733 = lut_tile_2_5_chanxy_out[11];
    assign wire_1735 = lut_tile_2_5_chanxy_out[12];
    assign wire_1737 = lut_tile_2_5_chanxy_out[13];
    assign wire_1739 = lut_tile_2_5_chanxy_out[14];
    assign wire_1740 = lut_tile_2_5_chanxy_out[15];
    assign wire_1741 = lut_tile_2_5_chanxy_out[16];
    assign wire_1742 = lut_tile_2_5_chanxy_out[17];
    assign wire_1743 = lut_tile_2_5_chanxy_out[18];
    assign wire_1744 = lut_tile_2_5_chanxy_out[19];
    assign wire_1745 = lut_tile_2_5_chanxy_out[20];
    assign wire_1746 = lut_tile_2_5_chanxy_out[21];
    assign wire_1747 = lut_tile_2_5_chanxy_out[22];
    assign wire_1748 = lut_tile_2_5_chanxy_out[23];
    assign wire_1749 = lut_tile_2_5_chanxy_out[24];
    assign wire_2397 = lut_tile_2_5_chanxy_out[25];
    assign wire_2405 = lut_tile_2_5_chanxy_out[26];
    assign wire_2413 = lut_tile_2_5_chanxy_out[27];
    assign wire_2421 = lut_tile_2_5_chanxy_out[28];
    assign wire_2429 = lut_tile_2_5_chanxy_out[29];
    assign wire_2430 = lut_tile_2_5_chanxy_out[30];
    assign wire_2432 = lut_tile_2_5_chanxy_out[31];
    assign wire_2434 = lut_tile_2_5_chanxy_out[32];
    assign wire_2436 = lut_tile_2_5_chanxy_out[33];
    assign wire_2438 = lut_tile_2_5_chanxy_out[34];
   // CHANXY OUT
    assign lut_tile_3_1_chanxy_in = {wire_2108, wire_1711, wire_1703, wire_1702, wire_1689, wire_1688, wire_1684, wire_1675, wire_1674, wire_2100, wire_1719, wire_1699, wire_1698, wire_1692, wire_1687, wire_1686, wire_1673, wire_1672, wire_555, wire_2092, wire_1717, wire_1700, wire_1697, wire_1696, wire_1683, wire_1682, wire_1671, wire_1670, wire_555, wire_2084, wire_1715, wire_1708, wire_1707, wire_1706, wire_1695, wire_1694, wire_1681, wire_1680, wire_351, wire_2076, wire_1713, wire_1705, wire_1704, wire_1691, wire_1690, wire_1679, wire_1678, wire_1676, wire_351, wire_2139, wire_1799, wire_1781, wire_1780, wire_1769, wire_1768, wire_1755, wire_1754, wire_1750, wire_2137, wire_1791, wire_1789, wire_1788, wire_1782, wire_1777, wire_1776, wire_1763, wire_1762, wire_555, wire_2135, wire_1793, wire_1787, wire_1786, wire_1774, wire_1773, wire_1772, wire_1761, wire_1760, wire_555, wire_2133, wire_1795, wire_1785, wire_1784, wire_1771, wire_1770, wire_1766, wire_1757, wire_1756, wire_351, wire_2131, wire_1797, wire_1779, wire_1778, wire_1765, wire_1764, wire_1758, wire_1753, wire_1752, wire_351, wire_2035, wire_2034, wire_2007, wire_2006, wire_2059, wire_2028, wire_2133, wire_2127, wire_2126, wire_2111, wire_2110, wire_2094, wire_2089, wire_2088, wire_1799, wire_2053, wire_2004, wire_2043, wire_2042, wire_2049, wire_2048, wire_2033, wire_2032, wire_2135, wire_2129, wire_2128, wire_2113, wire_2112, wire_2097, wire_2096, wire_2086, wire_1797, wire_374, wire_1999, wire_1998, wire_2051, wire_1996, wire_2039, wire_2038, wire_2023, wire_2022, wire_2137, wire_2125, wire_2124, wire_2119, wire_2118, wire_2081, wire_2080, wire_2078, wire_1795, wire_374, wire_2041, wire_2040, wire_2057, wire_2020, wire_2047, wire_2046, wire_2031, wire_2030, wire_2139, wire_2121, wire_2120, wire_2115, wire_2114, wire_2105, wire_2104, wire_2070, wire_1793, wire_350, wire_2037, wire_2036, wire_2015, wire_2014, wire_374, wire_1991, wire_1990, wire_374, wire_2055, wire_2012, wire_350, wire_2131, wire_2123, wire_2122, wire_2117, wire_2116, wire_2102, wire_2073, wire_2072, wire_1791, wire_350, wire_2045, wire_2044, wire_350};
    // CHNAXY TOTAL: 191
    assign wire_1750 = lut_tile_3_1_chanxy_out[0];
    assign wire_1751 = lut_tile_3_1_chanxy_out[1];
    assign wire_1752 = lut_tile_3_1_chanxy_out[2];
    assign wire_1754 = lut_tile_3_1_chanxy_out[3];
    assign wire_1756 = lut_tile_3_1_chanxy_out[4];
    assign wire_1758 = lut_tile_3_1_chanxy_out[5];
    assign wire_1759 = lut_tile_3_1_chanxy_out[6];
    assign wire_1760 = lut_tile_3_1_chanxy_out[7];
    assign wire_1762 = lut_tile_3_1_chanxy_out[8];
    assign wire_1764 = lut_tile_3_1_chanxy_out[9];
    assign wire_1766 = lut_tile_3_1_chanxy_out[10];
    assign wire_1767 = lut_tile_3_1_chanxy_out[11];
    assign wire_1768 = lut_tile_3_1_chanxy_out[12];
    assign wire_1770 = lut_tile_3_1_chanxy_out[13];
    assign wire_1772 = lut_tile_3_1_chanxy_out[14];
    assign wire_1774 = lut_tile_3_1_chanxy_out[15];
    assign wire_1775 = lut_tile_3_1_chanxy_out[16];
    assign wire_1776 = lut_tile_3_1_chanxy_out[17];
    assign wire_1778 = lut_tile_3_1_chanxy_out[18];
    assign wire_1780 = lut_tile_3_1_chanxy_out[19];
    assign wire_1782 = lut_tile_3_1_chanxy_out[20];
    assign wire_1783 = lut_tile_3_1_chanxy_out[21];
    assign wire_1784 = lut_tile_3_1_chanxy_out[22];
    assign wire_1786 = lut_tile_3_1_chanxy_out[23];
    assign wire_1788 = lut_tile_3_1_chanxy_out[24];
    assign wire_2071 = lut_tile_3_1_chanxy_out[25];
    assign wire_2079 = lut_tile_3_1_chanxy_out[26];
    assign wire_2087 = lut_tile_3_1_chanxy_out[27];
    assign wire_2095 = lut_tile_3_1_chanxy_out[28];
    assign wire_2103 = lut_tile_3_1_chanxy_out[29];
    assign wire_2120 = lut_tile_3_1_chanxy_out[30];
    assign wire_2122 = lut_tile_3_1_chanxy_out[31];
    assign wire_2124 = lut_tile_3_1_chanxy_out[32];
    assign wire_2126 = lut_tile_3_1_chanxy_out[33];
    assign wire_2128 = lut_tile_3_1_chanxy_out[34];
   // CHANXY OUT
    assign lut_tile_3_2_chanxy_in = {wire_2182, wire_1721, wire_1711, wire_1710, wire_1705, wire_1704, wire_1691, wire_1690, wire_1678, wire_2174, wire_1729, wire_1717, wire_1716, wire_1689, wire_1688, wire_1686, wire_1675, wire_1674, wire_761, wire_2166, wire_1727, wire_1713, wire_1712, wire_1699, wire_1698, wire_1694, wire_1673, wire_1672, wire_761, wire_2158, wire_1725, wire_1719, wire_1718, wire_1702, wire_1697, wire_1696, wire_1683, wire_1682, wire_557, wire_2150, wire_1723, wire_1715, wire_1714, wire_1707, wire_1706, wire_1681, wire_1680, wire_1670, wire_557, wire_2219, wire_1809, wire_1799, wire_1798, wire_1771, wire_1770, wire_1757, wire_1756, wire_1752, wire_2217, wire_1801, wire_1795, wire_1794, wire_1784, wire_1781, wire_1780, wire_1755, wire_1754, wire_761, wire_2215, wire_1803, wire_1791, wire_1790, wire_1779, wire_1778, wire_1776, wire_1765, wire_1764, wire_761, wire_2213, wire_1805, wire_1797, wire_1796, wire_1789, wire_1788, wire_1768, wire_1763, wire_1762, wire_557, wire_2211, wire_1807, wire_1793, wire_1792, wire_1787, wire_1786, wire_1773, wire_1772, wire_1760, wire_557, wire_2137, wire_2121, wire_2120, wire_2115, wire_2114, wire_2105, wire_2104, wire_2102, wire_1782, wire_2135, wire_2127, wire_2126, wire_2111, wire_2110, wire_2089, wire_2088, wire_2070, wire_1774, wire_580, wire_2133, wire_2123, wire_2122, wire_2117, wire_2116, wire_2078, wire_2073, wire_2072, wire_1766, wire_580, wire_2131, wire_2129, wire_2128, wire_2113, wire_2112, wire_2097, wire_2096, wire_2086, wire_1758, wire_556, wire_2139, wire_2125, wire_2124, wire_2119, wire_2118, wire_2094, wire_2081, wire_2080, wire_1750, wire_556, wire_2213, wire_2209, wire_2208, wire_2191, wire_2190, wire_2176, wire_2171, wire_2170, wire_1809, wire_2215, wire_2205, wire_2204, wire_2197, wire_2196, wire_2168, wire_2155, wire_2154, wire_1807, wire_580, wire_2217, wire_2201, wire_2200, wire_2193, wire_2192, wire_2179, wire_2178, wire_2160, wire_1805, wire_580, wire_2219, wire_2207, wire_2206, wire_2199, wire_2198, wire_2163, wire_2162, wire_2152, wire_1803, wire_556, wire_2211, wire_2203, wire_2202, wire_2195, wire_2194, wire_2187, wire_2186, wire_2184, wire_1801, wire_556};
    // CHNAXY TOTAL: 196
    assign wire_1753 = lut_tile_3_2_chanxy_out[0];
    assign wire_1761 = lut_tile_3_2_chanxy_out[1];
    assign wire_1769 = lut_tile_3_2_chanxy_out[2];
    assign wire_1777 = lut_tile_3_2_chanxy_out[3];
    assign wire_1785 = lut_tile_3_2_chanxy_out[4];
    assign wire_1790 = lut_tile_3_2_chanxy_out[5];
    assign wire_1792 = lut_tile_3_2_chanxy_out[6];
    assign wire_1794 = lut_tile_3_2_chanxy_out[7];
    assign wire_1796 = lut_tile_3_2_chanxy_out[8];
    assign wire_1798 = lut_tile_3_2_chanxy_out[9];
    assign wire_2153 = lut_tile_3_2_chanxy_out[10];
    assign wire_2161 = lut_tile_3_2_chanxy_out[11];
    assign wire_2169 = lut_tile_3_2_chanxy_out[12];
    assign wire_2177 = lut_tile_3_2_chanxy_out[13];
    assign wire_2185 = lut_tile_3_2_chanxy_out[14];
    assign wire_2200 = lut_tile_3_2_chanxy_out[15];
    assign wire_2202 = lut_tile_3_2_chanxy_out[16];
    assign wire_2204 = lut_tile_3_2_chanxy_out[17];
    assign wire_2206 = lut_tile_3_2_chanxy_out[18];
    assign wire_2208 = lut_tile_3_2_chanxy_out[19];
   // CHANXY OUT
    assign lut_tile_3_3_chanxy_in = {wire_2264, wire_1731, wire_1727, wire_1726, wire_1719, wire_1718, wire_1683, wire_1682, wire_1680, wire_2256, wire_1739, wire_1725, wire_1724, wire_1717, wire_1716, wire_1688, wire_1675, wire_1674, wire_967, wire_2248, wire_1737, wire_1723, wire_1722, wire_1715, wire_1714, wire_1707, wire_1706, wire_1696, wire_967, wire_2240, wire_1735, wire_1721, wire_1720, wire_1713, wire_1712, wire_1704, wire_1699, wire_1698, wire_763, wire_2232, wire_1733, wire_1729, wire_1728, wire_1711, wire_1710, wire_1691, wire_1690, wire_1672, wire_763, wire_2299, wire_1819, wire_1803, wire_1802, wire_1797, wire_1796, wire_1789, wire_1788, wire_1754, wire_2297, wire_1811, wire_1801, wire_1800, wire_1795, wire_1794, wire_1786, wire_1781, wire_1780, wire_967, wire_2295, wire_1813, wire_1809, wire_1808, wire_1793, wire_1792, wire_1778, wire_1773, wire_1772, wire_967, wire_2293, wire_1815, wire_1807, wire_1806, wire_1791, wire_1790, wire_1770, wire_1765, wire_1764, wire_763, wire_2291, wire_1817, wire_1805, wire_1804, wire_1799, wire_1798, wire_1762, wire_1757, wire_1756, wire_763, wire_2217, wire_2207, wire_2206, wire_2199, wire_2198, wire_2184, wire_2163, wire_2162, wire_1784, wire_2215, wire_2205, wire_2204, wire_2197, wire_2196, wire_2155, wire_2154, wire_2152, wire_1776, wire_786, wire_2213, wire_2203, wire_2202, wire_2195, wire_2194, wire_2187, wire_2186, wire_2160, wire_1768, wire_786, wire_2211, wire_2201, wire_2200, wire_2193, wire_2192, wire_2179, wire_2178, wire_2168, wire_1760, wire_762, wire_2219, wire_2209, wire_2208, wire_2191, wire_2190, wire_2176, wire_2171, wire_2170, wire_1752, wire_762, wire_2293, wire_2283, wire_2282, wire_2277, wire_2276, wire_2269, wire_2268, wire_2258, wire_1819, wire_2295, wire_2281, wire_2280, wire_2275, wire_2274, wire_2261, wire_2260, wire_2250, wire_1817, wire_786, wire_2297, wire_2289, wire_2288, wire_2273, wire_2272, wire_2253, wire_2252, wire_2242, wire_1815, wire_786, wire_2299, wire_2287, wire_2286, wire_2271, wire_2270, wire_2245, wire_2244, wire_2234, wire_1813, wire_762, wire_2291, wire_2285, wire_2284, wire_2279, wire_2278, wire_2266, wire_2237, wire_2236, wire_1811, wire_762};
    // CHNAXY TOTAL: 196
    assign wire_1755 = lut_tile_3_3_chanxy_out[0];
    assign wire_1763 = lut_tile_3_3_chanxy_out[1];
    assign wire_1771 = lut_tile_3_3_chanxy_out[2];
    assign wire_1779 = lut_tile_3_3_chanxy_out[3];
    assign wire_1787 = lut_tile_3_3_chanxy_out[4];
    assign wire_1800 = lut_tile_3_3_chanxy_out[5];
    assign wire_1802 = lut_tile_3_3_chanxy_out[6];
    assign wire_1804 = lut_tile_3_3_chanxy_out[7];
    assign wire_1806 = lut_tile_3_3_chanxy_out[8];
    assign wire_1808 = lut_tile_3_3_chanxy_out[9];
    assign wire_2235 = lut_tile_3_3_chanxy_out[10];
    assign wire_2243 = lut_tile_3_3_chanxy_out[11];
    assign wire_2251 = lut_tile_3_3_chanxy_out[12];
    assign wire_2259 = lut_tile_3_3_chanxy_out[13];
    assign wire_2267 = lut_tile_3_3_chanxy_out[14];
    assign wire_2280 = lut_tile_3_3_chanxy_out[15];
    assign wire_2282 = lut_tile_3_3_chanxy_out[16];
    assign wire_2284 = lut_tile_3_3_chanxy_out[17];
    assign wire_2286 = lut_tile_3_3_chanxy_out[18];
    assign wire_2288 = lut_tile_3_3_chanxy_out[19];
   // CHANXY OUT
    assign lut_tile_3_4_chanxy_in = {wire_2346, wire_1741, wire_1731, wire_1730, wire_1725, wire_1724, wire_1717, wire_1716, wire_1682, wire_2338, wire_1749, wire_1733, wire_1732, wire_1727, wire_1726, wire_1719, wire_1718, wire_1690, wire_1173, wire_2330, wire_1747, wire_1739, wire_1738, wire_1723, wire_1722, wire_1715, wire_1714, wire_1698, wire_1173, wire_2322, wire_1745, wire_1735, wire_1734, wire_1729, wire_1728, wire_1711, wire_1710, wire_1706, wire_969, wire_2314, wire_1743, wire_1737, wire_1736, wire_1721, wire_1720, wire_1713, wire_1712, wire_1674, wire_969, wire_2379, wire_1829, wire_1817, wire_1816, wire_1801, wire_1800, wire_1795, wire_1794, wire_1756, wire_2377, wire_1821, wire_1819, wire_1818, wire_1803, wire_1802, wire_1797, wire_1796, wire_1788, wire_1173, wire_2375, wire_1823, wire_1815, wire_1814, wire_1809, wire_1808, wire_1793, wire_1792, wire_1780, wire_1173, wire_2373, wire_1825, wire_1811, wire_1810, wire_1805, wire_1804, wire_1799, wire_1798, wire_1772, wire_969, wire_2371, wire_1827, wire_1813, wire_1812, wire_1807, wire_1806, wire_1791, wire_1790, wire_1764, wire_969, wire_2297, wire_2281, wire_2280, wire_2275, wire_2274, wire_2266, wire_2261, wire_2260, wire_1786, wire_2295, wire_2283, wire_2282, wire_2277, wire_2276, wire_2269, wire_2268, wire_2234, wire_1778, wire_992, wire_2293, wire_2289, wire_2288, wire_2273, wire_2272, wire_2253, wire_2252, wire_2242, wire_1770, wire_992, wire_2291, wire_2285, wire_2284, wire_2279, wire_2278, wire_2250, wire_2237, wire_2236, wire_1762, wire_968, wire_2299, wire_2287, wire_2286, wire_2271, wire_2270, wire_2258, wire_2245, wire_2244, wire_1754, wire_968, wire_2373, wire_2367, wire_2366, wire_2351, wire_2350, wire_2340, wire_2327, wire_2326, wire_1829, wire_2375, wire_2369, wire_2368, wire_2353, wire_2352, wire_2335, wire_2334, wire_2332, wire_1827, wire_992, wire_2377, wire_2365, wire_2364, wire_2359, wire_2358, wire_2324, wire_2319, wire_2318, wire_1825, wire_992, wire_2379, wire_2361, wire_2360, wire_2355, wire_2354, wire_2343, wire_2342, wire_2316, wire_1823, wire_968, wire_2371, wire_2363, wire_2362, wire_2357, wire_2356, wire_2348, wire_2311, wire_2310, wire_1821, wire_968};
    // CHNAXY TOTAL: 196
    assign wire_1757 = lut_tile_3_4_chanxy_out[0];
    assign wire_1765 = lut_tile_3_4_chanxy_out[1];
    assign wire_1773 = lut_tile_3_4_chanxy_out[2];
    assign wire_1781 = lut_tile_3_4_chanxy_out[3];
    assign wire_1789 = lut_tile_3_4_chanxy_out[4];
    assign wire_1810 = lut_tile_3_4_chanxy_out[5];
    assign wire_1812 = lut_tile_3_4_chanxy_out[6];
    assign wire_1814 = lut_tile_3_4_chanxy_out[7];
    assign wire_1816 = lut_tile_3_4_chanxy_out[8];
    assign wire_1818 = lut_tile_3_4_chanxy_out[9];
    assign wire_2317 = lut_tile_3_4_chanxy_out[10];
    assign wire_2325 = lut_tile_3_4_chanxy_out[11];
    assign wire_2333 = lut_tile_3_4_chanxy_out[12];
    assign wire_2341 = lut_tile_3_4_chanxy_out[13];
    assign wire_2349 = lut_tile_3_4_chanxy_out[14];
    assign wire_2360 = lut_tile_3_4_chanxy_out[15];
    assign wire_2362 = lut_tile_3_4_chanxy_out[16];
    assign wire_2364 = lut_tile_3_4_chanxy_out[17];
    assign wire_2366 = lut_tile_3_4_chanxy_out[18];
    assign wire_2368 = lut_tile_3_4_chanxy_out[19];
   // CHANXY OUT
    assign lut_tile_3_5_chanxy_in = {wire_2428, wire_1746, wire_1734, wire_1722, wire_1718, wire_1409, wire_1400, wire_1394, wire_2420, wire_1748, wire_1736, wire_1724, wire_1710, wire_1406, wire_1400, wire_1391, wire_2412, wire_1740, wire_1738, wire_1726, wire_1712, wire_1412, wire_1406, wire_1397, wire_1391, wire_2404, wire_1742, wire_1730, wire_1728, wire_1714, wire_1412, wire_1403, wire_1397, wire_1175, wire_2396, wire_1744, wire_1732, wire_1720, wire_1716, wire_1409, wire_1403, wire_1394, wire_1175, wire_2459, wire_1828, wire_1816, wire_1804, wire_1792, wire_1409, wire_1400, wire_1394, wire_2457, wire_1820, wire_1818, wire_1806, wire_1794, wire_1406, wire_1400, wire_1391, wire_2455, wire_1822, wire_1810, wire_1808, wire_1796, wire_1412, wire_1406, wire_1397, wire_1391, wire_2453, wire_1824, wire_1812, wire_1800, wire_1798, wire_1412, wire_1403, wire_1397, wire_1175, wire_2451, wire_1826, wire_1814, wire_1802, wire_1790, wire_1409, wire_1403, wire_1394, wire_1175, wire_2455, wire_2406, wire_2377, wire_2361, wire_2360, wire_2355, wire_2354, wire_2348, wire_2343, wire_2342, wire_1788, wire_2439, wire_2438, wire_2375, wire_2367, wire_2366, wire_2351, wire_2350, wire_2327, wire_2326, wire_2316, wire_1780, wire_1198, wire_2459, wire_2422, wire_2373, wire_2363, wire_2362, wire_2357, wire_2356, wire_2324, wire_2311, wire_2310, wire_1772, wire_1198, wire_2417, wire_2416, wire_2371, wire_2369, wire_2368, wire_2353, wire_2352, wire_2335, wire_2334, wire_2332, wire_1764, wire_1174, wire_2393, wire_2392, wire_1198, wire_2379, wire_2365, wire_2364, wire_2359, wire_2358, wire_2340, wire_2319, wire_2318, wire_1756, wire_1174, wire_2449, wire_2448, wire_2401, wire_2400, wire_2447, wire_2446, wire_2431, wire_2430, wire_2435, wire_2434, wire_1198, wire_2443, wire_2442, wire_2453, wire_2398, wire_2441, wire_2440, wire_2457, wire_2414, wire_2409, wire_2408, wire_1174, wire_2433, wire_2432, wire_2425, wire_2424, wire_2437, wire_2436, wire_2445, wire_2444, wire_2451, wire_2390, wire_1174};
    // CHNAXY TOTAL: 179
    assign wire_1791 = lut_tile_3_5_chanxy_out[0];
    assign wire_1793 = lut_tile_3_5_chanxy_out[1];
    assign wire_1795 = lut_tile_3_5_chanxy_out[2];
    assign wire_1797 = lut_tile_3_5_chanxy_out[3];
    assign wire_1799 = lut_tile_3_5_chanxy_out[4];
    assign wire_1801 = lut_tile_3_5_chanxy_out[5];
    assign wire_1803 = lut_tile_3_5_chanxy_out[6];
    assign wire_1805 = lut_tile_3_5_chanxy_out[7];
    assign wire_1807 = lut_tile_3_5_chanxy_out[8];
    assign wire_1809 = lut_tile_3_5_chanxy_out[9];
    assign wire_1811 = lut_tile_3_5_chanxy_out[10];
    assign wire_1813 = lut_tile_3_5_chanxy_out[11];
    assign wire_1815 = lut_tile_3_5_chanxy_out[12];
    assign wire_1817 = lut_tile_3_5_chanxy_out[13];
    assign wire_1819 = lut_tile_3_5_chanxy_out[14];
    assign wire_1820 = lut_tile_3_5_chanxy_out[15];
    assign wire_1821 = lut_tile_3_5_chanxy_out[16];
    assign wire_1822 = lut_tile_3_5_chanxy_out[17];
    assign wire_1823 = lut_tile_3_5_chanxy_out[18];
    assign wire_1824 = lut_tile_3_5_chanxy_out[19];
    assign wire_1825 = lut_tile_3_5_chanxy_out[20];
    assign wire_1826 = lut_tile_3_5_chanxy_out[21];
    assign wire_1827 = lut_tile_3_5_chanxy_out[22];
    assign wire_1828 = lut_tile_3_5_chanxy_out[23];
    assign wire_1829 = lut_tile_3_5_chanxy_out[24];
    assign wire_2391 = lut_tile_3_5_chanxy_out[25];
    assign wire_2399 = lut_tile_3_5_chanxy_out[26];
    assign wire_2407 = lut_tile_3_5_chanxy_out[27];
    assign wire_2415 = lut_tile_3_5_chanxy_out[28];
    assign wire_2423 = lut_tile_3_5_chanxy_out[29];
    assign wire_2440 = lut_tile_3_5_chanxy_out[30];
    assign wire_2442 = lut_tile_3_5_chanxy_out[31];
    assign wire_2444 = lut_tile_3_5_chanxy_out[32];
    assign wire_2446 = lut_tile_3_5_chanxy_out[33];
    assign wire_2448 = lut_tile_3_5_chanxy_out[34];
   // CHANXY OUT
    assign lut_tile_4_1_chanxy_in = {wire_2102, wire_1791, wire_1785, wire_1784, wire_1771, wire_1770, wire_1758, wire_1757, wire_1756, wire_2094, wire_1799, wire_1781, wire_1780, wire_1769, wire_1768, wire_1766, wire_1755, wire_1754, wire_577, wire_2086, wire_1797, wire_1779, wire_1778, wire_1774, wire_1765, wire_1764, wire_1753, wire_1752, wire_577, wire_2078, wire_1795, wire_1789, wire_1788, wire_1782, wire_1777, wire_1776, wire_1763, wire_1762, wire_373, wire_2070, wire_1793, wire_1787, wire_1786, wire_1773, wire_1772, wire_1761, wire_1760, wire_1750, wire_373, wire_2149, wire_1879, wire_1863, wire_1862, wire_1851, wire_1850, wire_1837, wire_1836, wire_1832, wire_2147, wire_1871, wire_1864, wire_1861, wire_1860, wire_1847, wire_1846, wire_1835, wire_1834, wire_577, wire_2145, wire_1873, wire_1859, wire_1858, wire_1856, wire_1845, wire_1844, wire_1831, wire_1830, wire_577, wire_2143, wire_1875, wire_1869, wire_1868, wire_1855, wire_1854, wire_1848, wire_1843, wire_1842, wire_373, wire_2141, wire_1877, wire_1867, wire_1866, wire_1853, wire_1852, wire_1840, wire_1839, wire_1838, wire_373, wire_2035, wire_2034, wire_2065, wire_2006, wire_2143, wire_2139, wire_2138, wire_2121, wire_2120, wire_2115, wire_2114, wire_2096, wire_1879, wire_2059, wire_2058, wire_2053, wire_2052, wire_2043, wire_2042, wire_2049, wire_2048, wire_2145, wire_2135, wire_2134, wire_2127, wire_2126, wire_2111, wire_2110, wire_2088, wire_1877, wire_396, wire_2033, wire_2032, wire_2063, wire_1998, wire_2051, wire_2050, wire_2039, wire_2038, wire_2147, wire_2131, wire_2130, wire_2123, wire_2122, wire_2117, wire_2116, wire_2080, wire_1875, wire_396, wire_2069, wire_2022, wire_2041, wire_2040, wire_2057, wire_2056, wire_2047, wire_2046, wire_2149, wire_2137, wire_2136, wire_2129, wire_2128, wire_2113, wire_2112, wire_2072, wire_1873, wire_372, wire_2031, wire_2030, wire_2037, wire_2036, wire_2067, wire_2014, wire_396, wire_2061, wire_1990, wire_396, wire_2141, wire_2133, wire_2132, wire_2125, wire_2124, wire_2119, wire_2118, wire_2104, wire_1871, wire_372, wire_2055, wire_2054, wire_372, wire_2045, wire_2044, wire_372};
    // CHNAXY TOTAL: 191
    assign wire_1830 = lut_tile_4_1_chanxy_out[0];
    assign wire_1832 = lut_tile_4_1_chanxy_out[1];
    assign wire_1833 = lut_tile_4_1_chanxy_out[2];
    assign wire_1834 = lut_tile_4_1_chanxy_out[3];
    assign wire_1836 = lut_tile_4_1_chanxy_out[4];
    assign wire_1838 = lut_tile_4_1_chanxy_out[5];
    assign wire_1840 = lut_tile_4_1_chanxy_out[6];
    assign wire_1841 = lut_tile_4_1_chanxy_out[7];
    assign wire_1842 = lut_tile_4_1_chanxy_out[8];
    assign wire_1844 = lut_tile_4_1_chanxy_out[9];
    assign wire_1846 = lut_tile_4_1_chanxy_out[10];
    assign wire_1848 = lut_tile_4_1_chanxy_out[11];
    assign wire_1849 = lut_tile_4_1_chanxy_out[12];
    assign wire_1850 = lut_tile_4_1_chanxy_out[13];
    assign wire_1852 = lut_tile_4_1_chanxy_out[14];
    assign wire_1854 = lut_tile_4_1_chanxy_out[15];
    assign wire_1856 = lut_tile_4_1_chanxy_out[16];
    assign wire_1857 = lut_tile_4_1_chanxy_out[17];
    assign wire_1858 = lut_tile_4_1_chanxy_out[18];
    assign wire_1860 = lut_tile_4_1_chanxy_out[19];
    assign wire_1862 = lut_tile_4_1_chanxy_out[20];
    assign wire_1864 = lut_tile_4_1_chanxy_out[21];
    assign wire_1865 = lut_tile_4_1_chanxy_out[22];
    assign wire_1866 = lut_tile_4_1_chanxy_out[23];
    assign wire_1868 = lut_tile_4_1_chanxy_out[24];
    assign wire_2073 = lut_tile_4_1_chanxy_out[25];
    assign wire_2081 = lut_tile_4_1_chanxy_out[26];
    assign wire_2089 = lut_tile_4_1_chanxy_out[27];
    assign wire_2097 = lut_tile_4_1_chanxy_out[28];
    assign wire_2105 = lut_tile_4_1_chanxy_out[29];
    assign wire_2130 = lut_tile_4_1_chanxy_out[30];
    assign wire_2132 = lut_tile_4_1_chanxy_out[31];
    assign wire_2134 = lut_tile_4_1_chanxy_out[32];
    assign wire_2136 = lut_tile_4_1_chanxy_out[33];
    assign wire_2138 = lut_tile_4_1_chanxy_out[34];
   // CHANXY OUT
    assign lut_tile_4_2_chanxy_in = {wire_2184, wire_1801, wire_1797, wire_1796, wire_1789, wire_1788, wire_1763, wire_1762, wire_1760, wire_2176, wire_1809, wire_1795, wire_1794, wire_1781, wire_1780, wire_1768, wire_1755, wire_1754, wire_783, wire_2168, wire_1807, wire_1793, wire_1792, wire_1787, wire_1786, wire_1776, wire_1773, wire_1772, wire_783, wire_2160, wire_1805, wire_1791, wire_1790, wire_1784, wire_1779, wire_1778, wire_1765, wire_1764, wire_579, wire_2152, wire_1803, wire_1799, wire_1798, wire_1771, wire_1770, wire_1757, wire_1756, wire_1752, wire_579, wire_2229, wire_1889, wire_1873, wire_1872, wire_1869, wire_1868, wire_1855, wire_1854, wire_1834, wire_2227, wire_1881, wire_1871, wire_1870, wire_1866, wire_1861, wire_1860, wire_1847, wire_1846, wire_783, wire_2225, wire_1883, wire_1879, wire_1878, wire_1858, wire_1853, wire_1852, wire_1839, wire_1838, wire_783, wire_2223, wire_1885, wire_1877, wire_1876, wire_1850, wire_1845, wire_1844, wire_1831, wire_1830, wire_579, wire_2221, wire_1887, wire_1875, wire_1874, wire_1863, wire_1862, wire_1842, wire_1837, wire_1836, wire_579, wire_2147, wire_2137, wire_2136, wire_2129, wire_2128, wire_2113, wire_2112, wire_2104, wire_1864, wire_2145, wire_2135, wire_2134, wire_2127, wire_2126, wire_2111, wire_2110, wire_2072, wire_1856, wire_602, wire_2143, wire_2133, wire_2132, wire_2125, wire_2124, wire_2119, wire_2118, wire_2080, wire_1848, wire_602, wire_2141, wire_2131, wire_2130, wire_2123, wire_2122, wire_2117, wire_2116, wire_2088, wire_1840, wire_578, wire_2149, wire_2139, wire_2138, wire_2121, wire_2120, wire_2115, wire_2114, wire_2096, wire_1832, wire_578, wire_2223, wire_2213, wire_2212, wire_2207, wire_2206, wire_2199, wire_2198, wire_2178, wire_1889, wire_2225, wire_2211, wire_2210, wire_2205, wire_2204, wire_2197, wire_2196, wire_2170, wire_1887, wire_602, wire_2227, wire_2219, wire_2218, wire_2203, wire_2202, wire_2195, wire_2194, wire_2162, wire_1885, wire_602, wire_2229, wire_2217, wire_2216, wire_2201, wire_2200, wire_2193, wire_2192, wire_2154, wire_1883, wire_578, wire_2221, wire_2215, wire_2214, wire_2209, wire_2208, wire_2191, wire_2190, wire_2186, wire_1881, wire_578};
    // CHNAXY TOTAL: 196
    assign wire_1835 = lut_tile_4_2_chanxy_out[0];
    assign wire_1843 = lut_tile_4_2_chanxy_out[1];
    assign wire_1851 = lut_tile_4_2_chanxy_out[2];
    assign wire_1859 = lut_tile_4_2_chanxy_out[3];
    assign wire_1867 = lut_tile_4_2_chanxy_out[4];
    assign wire_1870 = lut_tile_4_2_chanxy_out[5];
    assign wire_1872 = lut_tile_4_2_chanxy_out[6];
    assign wire_1874 = lut_tile_4_2_chanxy_out[7];
    assign wire_1876 = lut_tile_4_2_chanxy_out[8];
    assign wire_1878 = lut_tile_4_2_chanxy_out[9];
    assign wire_2155 = lut_tile_4_2_chanxy_out[10];
    assign wire_2163 = lut_tile_4_2_chanxy_out[11];
    assign wire_2171 = lut_tile_4_2_chanxy_out[12];
    assign wire_2179 = lut_tile_4_2_chanxy_out[13];
    assign wire_2187 = lut_tile_4_2_chanxy_out[14];
    assign wire_2210 = lut_tile_4_2_chanxy_out[15];
    assign wire_2212 = lut_tile_4_2_chanxy_out[16];
    assign wire_2214 = lut_tile_4_2_chanxy_out[17];
    assign wire_2216 = lut_tile_4_2_chanxy_out[18];
    assign wire_2218 = lut_tile_4_2_chanxy_out[19];
   // CHANXY OUT
    assign lut_tile_4_3_chanxy_in = {wire_2266, wire_1811, wire_1801, wire_1800, wire_1795, wire_1794, wire_1781, wire_1780, wire_1762, wire_2258, wire_1819, wire_1803, wire_1802, wire_1797, wire_1796, wire_1789, wire_1788, wire_1770, wire_989, wire_2250, wire_1817, wire_1809, wire_1808, wire_1793, wire_1792, wire_1778, wire_1773, wire_1772, wire_989, wire_2242, wire_1815, wire_1805, wire_1804, wire_1799, wire_1798, wire_1786, wire_1757, wire_1756, wire_785, wire_2234, wire_1813, wire_1807, wire_1806, wire_1791, wire_1790, wire_1765, wire_1764, wire_1754, wire_785, wire_2309, wire_1899, wire_1887, wire_1886, wire_1871, wire_1870, wire_1847, wire_1846, wire_1836, wire_2307, wire_1891, wire_1889, wire_1888, wire_1873, wire_1872, wire_1868, wire_1855, wire_1854, wire_989, wire_2305, wire_1893, wire_1885, wire_1884, wire_1879, wire_1878, wire_1860, wire_1839, wire_1838, wire_989, wire_2303, wire_1895, wire_1881, wire_1880, wire_1875, wire_1874, wire_1863, wire_1862, wire_1852, wire_785, wire_2301, wire_1897, wire_1883, wire_1882, wire_1877, wire_1876, wire_1844, wire_1831, wire_1830, wire_785, wire_2227, wire_2211, wire_2210, wire_2205, wire_2204, wire_2197, wire_2196, wire_2186, wire_1866, wire_2225, wire_2213, wire_2212, wire_2207, wire_2206, wire_2199, wire_2198, wire_2154, wire_1858, wire_808, wire_2223, wire_2219, wire_2218, wire_2203, wire_2202, wire_2195, wire_2194, wire_2162, wire_1850, wire_808, wire_2221, wire_2215, wire_2214, wire_2209, wire_2208, wire_2191, wire_2190, wire_2170, wire_1842, wire_784, wire_2229, wire_2217, wire_2216, wire_2201, wire_2200, wire_2193, wire_2192, wire_2178, wire_1834, wire_784, wire_2303, wire_2297, wire_2296, wire_2281, wire_2280, wire_2275, wire_2274, wire_2260, wire_1899, wire_2305, wire_2299, wire_2298, wire_2283, wire_2282, wire_2277, wire_2276, wire_2252, wire_1897, wire_808, wire_2307, wire_2295, wire_2294, wire_2289, wire_2288, wire_2273, wire_2272, wire_2244, wire_1895, wire_808, wire_2309, wire_2291, wire_2290, wire_2285, wire_2284, wire_2279, wire_2278, wire_2236, wire_1893, wire_784, wire_2301, wire_2293, wire_2292, wire_2287, wire_2286, wire_2271, wire_2270, wire_2268, wire_1891, wire_784};
    // CHNAXY TOTAL: 196
    assign wire_1837 = lut_tile_4_3_chanxy_out[0];
    assign wire_1845 = lut_tile_4_3_chanxy_out[1];
    assign wire_1853 = lut_tile_4_3_chanxy_out[2];
    assign wire_1861 = lut_tile_4_3_chanxy_out[3];
    assign wire_1869 = lut_tile_4_3_chanxy_out[4];
    assign wire_1880 = lut_tile_4_3_chanxy_out[5];
    assign wire_1882 = lut_tile_4_3_chanxy_out[6];
    assign wire_1884 = lut_tile_4_3_chanxy_out[7];
    assign wire_1886 = lut_tile_4_3_chanxy_out[8];
    assign wire_1888 = lut_tile_4_3_chanxy_out[9];
    assign wire_2237 = lut_tile_4_3_chanxy_out[10];
    assign wire_2245 = lut_tile_4_3_chanxy_out[11];
    assign wire_2253 = lut_tile_4_3_chanxy_out[12];
    assign wire_2261 = lut_tile_4_3_chanxy_out[13];
    assign wire_2269 = lut_tile_4_3_chanxy_out[14];
    assign wire_2290 = lut_tile_4_3_chanxy_out[15];
    assign wire_2292 = lut_tile_4_3_chanxy_out[16];
    assign wire_2294 = lut_tile_4_3_chanxy_out[17];
    assign wire_2296 = lut_tile_4_3_chanxy_out[18];
    assign wire_2298 = lut_tile_4_3_chanxy_out[19];
   // CHANXY OUT
    assign lut_tile_4_4_chanxy_in = {wire_2348, wire_1821, wire_1811, wire_1810, wire_1805, wire_1804, wire_1799, wire_1798, wire_1764, wire_2340, wire_1829, wire_1817, wire_1816, wire_1801, wire_1800, wire_1795, wire_1794, wire_1772, wire_1195, wire_2332, wire_1827, wire_1813, wire_1812, wire_1807, wire_1806, wire_1791, wire_1790, wire_1780, wire_1195, wire_2324, wire_1825, wire_1819, wire_1818, wire_1803, wire_1802, wire_1797, wire_1796, wire_1788, wire_991, wire_2316, wire_1823, wire_1815, wire_1814, wire_1809, wire_1808, wire_1793, wire_1792, wire_1756, wire_991, wire_2389, wire_1909, wire_1897, wire_1896, wire_1881, wire_1880, wire_1875, wire_1874, wire_1830, wire_2387, wire_1901, wire_1899, wire_1898, wire_1883, wire_1882, wire_1877, wire_1876, wire_1862, wire_1195, wire_2385, wire_1903, wire_1895, wire_1894, wire_1889, wire_1888, wire_1873, wire_1872, wire_1854, wire_1195, wire_2383, wire_1905, wire_1891, wire_1890, wire_1885, wire_1884, wire_1879, wire_1878, wire_1846, wire_991, wire_2381, wire_1907, wire_1893, wire_1892, wire_1887, wire_1886, wire_1871, wire_1870, wire_1838, wire_991, wire_2307, wire_2291, wire_2290, wire_2285, wire_2284, wire_2279, wire_2278, wire_2268, wire_1868, wire_2305, wire_2297, wire_2296, wire_2281, wire_2280, wire_2275, wire_2274, wire_2236, wire_1860, wire_1014, wire_2303, wire_2293, wire_2292, wire_2287, wire_2286, wire_2271, wire_2270, wire_2244, wire_1852, wire_1014, wire_2301, wire_2299, wire_2298, wire_2283, wire_2282, wire_2277, wire_2276, wire_2252, wire_1844, wire_990, wire_2309, wire_2295, wire_2294, wire_2289, wire_2288, wire_2273, wire_2272, wire_2260, wire_1836, wire_990, wire_2383, wire_2377, wire_2376, wire_2361, wire_2360, wire_2355, wire_2354, wire_2334, wire_1909, wire_2385, wire_2379, wire_2378, wire_2363, wire_2362, wire_2357, wire_2356, wire_2326, wire_1907, wire_1014, wire_2387, wire_2375, wire_2374, wire_2369, wire_2368, wire_2353, wire_2352, wire_2318, wire_1905, wire_1014, wire_2389, wire_2371, wire_2370, wire_2365, wire_2364, wire_2359, wire_2358, wire_2310, wire_1903, wire_990, wire_2381, wire_2373, wire_2372, wire_2367, wire_2366, wire_2351, wire_2350, wire_2342, wire_1901, wire_990};
    // CHNAXY TOTAL: 196
    assign wire_1831 = lut_tile_4_4_chanxy_out[0];
    assign wire_1839 = lut_tile_4_4_chanxy_out[1];
    assign wire_1847 = lut_tile_4_4_chanxy_out[2];
    assign wire_1855 = lut_tile_4_4_chanxy_out[3];
    assign wire_1863 = lut_tile_4_4_chanxy_out[4];
    assign wire_1890 = lut_tile_4_4_chanxy_out[5];
    assign wire_1892 = lut_tile_4_4_chanxy_out[6];
    assign wire_1894 = lut_tile_4_4_chanxy_out[7];
    assign wire_1896 = lut_tile_4_4_chanxy_out[8];
    assign wire_1898 = lut_tile_4_4_chanxy_out[9];
    assign wire_2311 = lut_tile_4_4_chanxy_out[10];
    assign wire_2319 = lut_tile_4_4_chanxy_out[11];
    assign wire_2327 = lut_tile_4_4_chanxy_out[12];
    assign wire_2335 = lut_tile_4_4_chanxy_out[13];
    assign wire_2343 = lut_tile_4_4_chanxy_out[14];
    assign wire_2370 = lut_tile_4_4_chanxy_out[15];
    assign wire_2372 = lut_tile_4_4_chanxy_out[16];
    assign wire_2374 = lut_tile_4_4_chanxy_out[17];
    assign wire_2376 = lut_tile_4_4_chanxy_out[18];
    assign wire_2378 = lut_tile_4_4_chanxy_out[19];
   // CHANXY OUT
    assign lut_tile_4_5_chanxy_in = {wire_2422, wire_1828, wire_1816, wire_1804, wire_1792, wire_1457, wire_1448, wire_1442, wire_2414, wire_1820, wire_1818, wire_1806, wire_1794, wire_1454, wire_1448, wire_1439, wire_2406, wire_1822, wire_1810, wire_1808, wire_1796, wire_1460, wire_1454, wire_1445, wire_1439, wire_2398, wire_1824, wire_1812, wire_1800, wire_1798, wire_1460, wire_1451, wire_1445, wire_1197, wire_2390, wire_1826, wire_1814, wire_1802, wire_1790, wire_1457, wire_1451, wire_1442, wire_1197, wire_2469, wire_1902, wire_1898, wire_1886, wire_1874, wire_1457, wire_1448, wire_1442, wire_2467, wire_1904, wire_1890, wire_1888, wire_1876, wire_1454, wire_1448, wire_1439, wire_2465, wire_1906, wire_1892, wire_1880, wire_1878, wire_1460, wire_1454, wire_1445, wire_1439, wire_2463, wire_1908, wire_1894, wire_1882, wire_1870, wire_1460, wire_1451, wire_1445, wire_1197, wire_2461, wire_1900, wire_1896, wire_1884, wire_1872, wire_1457, wire_1451, wire_1442, wire_1197, wire_2433, wire_2432, wire_2387, wire_2371, wire_2370, wire_2365, wire_2364, wire_2359, wire_2358, wire_2342, wire_1862, wire_2469, wire_2424, wire_2385, wire_2377, wire_2376, wire_2361, wire_2360, wire_2355, wire_2354, wire_2310, wire_1854, wire_1220, wire_2437, wire_2436, wire_2383, wire_2373, wire_2372, wire_2367, wire_2366, wire_2351, wire_2350, wire_2318, wire_1846, wire_1220, wire_2445, wire_2444, wire_2381, wire_2379, wire_2378, wire_2363, wire_2362, wire_2357, wire_2356, wire_2326, wire_1838, wire_1196, wire_2451, wire_2450, wire_1196, wire_2389, wire_2375, wire_2374, wire_2369, wire_2368, wire_2353, wire_2352, wire_2334, wire_1830, wire_1196, wire_2455, wire_2454, wire_2439, wire_2438, wire_2459, wire_2458, wire_2467, wire_2416, wire_2461, wire_2392, wire_1220, wire_2449, wire_2448, wire_2463, wire_2400, wire_2447, wire_2446, wire_2431, wire_2430, wire_2435, wire_2434, wire_1220, wire_2443, wire_2442, wire_2453, wire_2452, wire_2441, wire_2440, wire_2457, wire_2456, wire_2465, wire_2408, wire_1196};
    // CHNAXY TOTAL: 179
    assign wire_1871 = lut_tile_4_5_chanxy_out[0];
    assign wire_1873 = lut_tile_4_5_chanxy_out[1];
    assign wire_1875 = lut_tile_4_5_chanxy_out[2];
    assign wire_1877 = lut_tile_4_5_chanxy_out[3];
    assign wire_1879 = lut_tile_4_5_chanxy_out[4];
    assign wire_1881 = lut_tile_4_5_chanxy_out[5];
    assign wire_1883 = lut_tile_4_5_chanxy_out[6];
    assign wire_1885 = lut_tile_4_5_chanxy_out[7];
    assign wire_1887 = lut_tile_4_5_chanxy_out[8];
    assign wire_1889 = lut_tile_4_5_chanxy_out[9];
    assign wire_1891 = lut_tile_4_5_chanxy_out[10];
    assign wire_1893 = lut_tile_4_5_chanxy_out[11];
    assign wire_1895 = lut_tile_4_5_chanxy_out[12];
    assign wire_1897 = lut_tile_4_5_chanxy_out[13];
    assign wire_1899 = lut_tile_4_5_chanxy_out[14];
    assign wire_1900 = lut_tile_4_5_chanxy_out[15];
    assign wire_1901 = lut_tile_4_5_chanxy_out[16];
    assign wire_1902 = lut_tile_4_5_chanxy_out[17];
    assign wire_1903 = lut_tile_4_5_chanxy_out[18];
    assign wire_1904 = lut_tile_4_5_chanxy_out[19];
    assign wire_1905 = lut_tile_4_5_chanxy_out[20];
    assign wire_1906 = lut_tile_4_5_chanxy_out[21];
    assign wire_1907 = lut_tile_4_5_chanxy_out[22];
    assign wire_1908 = lut_tile_4_5_chanxy_out[23];
    assign wire_1909 = lut_tile_4_5_chanxy_out[24];
    assign wire_2393 = lut_tile_4_5_chanxy_out[25];
    assign wire_2401 = lut_tile_4_5_chanxy_out[26];
    assign wire_2409 = lut_tile_4_5_chanxy_out[27];
    assign wire_2417 = lut_tile_4_5_chanxy_out[28];
    assign wire_2425 = lut_tile_4_5_chanxy_out[29];
    assign wire_2450 = lut_tile_4_5_chanxy_out[30];
    assign wire_2452 = lut_tile_4_5_chanxy_out[31];
    assign wire_2454 = lut_tile_4_5_chanxy_out[32];
    assign wire_2456 = lut_tile_4_5_chanxy_out[33];
    assign wire_2458 = lut_tile_4_5_chanxy_out[34];
   // CHANXY OUT
    assign lut_tile_5_1_chanxy_in = {wire_1925, wire_1924, wire_2104, wire_1871, wire_1869, wire_1868, wire_1855, wire_1854, wire_1843, wire_1842, wire_1840, wire_1919, wire_1918, wire_2096, wire_1879, wire_1861, wire_1860, wire_1848, wire_1847, wire_1846, wire_1835, wire_1834, wire_599, wire_1917, wire_1916, wire_2088, wire_1877, wire_1867, wire_1866, wire_1856, wire_1853, wire_1852, wire_1839, wire_1838, wire_599, wire_1935, wire_1934, wire_2080, wire_1875, wire_1864, wire_1859, wire_1858, wire_1845, wire_1844, wire_1831, wire_1830, wire_395, wire_1929, wire_1928, wire_395, wire_2072, wire_1873, wire_1863, wire_1862, wire_1851, wire_1850, wire_1837, wire_1836, wire_1832, wire_395, wire_1953, wire_1922, wire_1945, wire_1944, wire_1957, wire_1938, wire_1933, wire_1932, wire_1911, wire_1910, wire_395, wire_1927, wire_1926, wire_1959, wire_1946, wire_1943, wire_1942, wire_1937, wire_1936, wire_1913, wire_1912, wire_599, wire_1949, wire_1948, wire_1921, wire_1920, wire_1941, wire_1940, wire_1951, wire_1914, wire_1955, wire_1930, wire_599, wire_2058, wire_2144, wire_2132, wire_2128, wire_2116, wire_1959, wire_441, wire_432, wire_426, wire_2060, wire_2030, wire_444, wire_2040, wire_444, wire_2050, wire_441, wire_2146, wire_2134, wire_2120, wire_2118, wire_1957, wire_438, wire_432, wire_423, wire_2062, wire_441, wire_2032, wire_438, wire_2042, wire_438, wire_2052, wire_435, wire_2148, wire_2136, wire_2122, wire_2110, wire_1955, wire_444, wire_438, wire_429, wire_423, wire_2064, wire_435, wire_2034, wire_432, wire_2044, wire_432, wire_2054, wire_429, wire_2140, wire_2138, wire_2124, wire_2112, wire_1953, wire_444, wire_435, wire_429, wire_394, wire_2066, wire_429, wire_2036, wire_426, wire_2046, wire_426, wire_2056, wire_423, wire_2142, wire_2130, wire_2126, wire_2114, wire_1951, wire_441, wire_435, wire_426, wire_394, wire_2068, wire_423, wire_2038, wire_394, wire_2048, wire_394};
    // CHNAXY TOTAL: 174
    assign wire_1910 = lut_tile_5_1_chanxy_out[0];
    assign wire_1912 = lut_tile_5_1_chanxy_out[1];
    assign wire_1914 = lut_tile_5_1_chanxy_out[2];
    assign wire_1915 = lut_tile_5_1_chanxy_out[3];
    assign wire_1916 = lut_tile_5_1_chanxy_out[4];
    assign wire_1918 = lut_tile_5_1_chanxy_out[5];
    assign wire_1920 = lut_tile_5_1_chanxy_out[6];
    assign wire_1922 = lut_tile_5_1_chanxy_out[7];
    assign wire_1923 = lut_tile_5_1_chanxy_out[8];
    assign wire_1924 = lut_tile_5_1_chanxy_out[9];
    assign wire_1926 = lut_tile_5_1_chanxy_out[10];
    assign wire_1928 = lut_tile_5_1_chanxy_out[11];
    assign wire_1930 = lut_tile_5_1_chanxy_out[12];
    assign wire_1931 = lut_tile_5_1_chanxy_out[13];
    assign wire_1932 = lut_tile_5_1_chanxy_out[14];
    assign wire_1934 = lut_tile_5_1_chanxy_out[15];
    assign wire_1936 = lut_tile_5_1_chanxy_out[16];
    assign wire_1938 = lut_tile_5_1_chanxy_out[17];
    assign wire_1939 = lut_tile_5_1_chanxy_out[18];
    assign wire_1940 = lut_tile_5_1_chanxy_out[19];
    assign wire_1942 = lut_tile_5_1_chanxy_out[20];
    assign wire_1944 = lut_tile_5_1_chanxy_out[21];
    assign wire_1946 = lut_tile_5_1_chanxy_out[22];
    assign wire_1947 = lut_tile_5_1_chanxy_out[23];
    assign wire_1948 = lut_tile_5_1_chanxy_out[24];
    assign wire_2111 = lut_tile_5_1_chanxy_out[25];
    assign wire_2113 = lut_tile_5_1_chanxy_out[26];
    assign wire_2115 = lut_tile_5_1_chanxy_out[27];
    assign wire_2117 = lut_tile_5_1_chanxy_out[28];
    assign wire_2119 = lut_tile_5_1_chanxy_out[29];
    assign wire_2121 = lut_tile_5_1_chanxy_out[30];
    assign wire_2123 = lut_tile_5_1_chanxy_out[31];
    assign wire_2125 = lut_tile_5_1_chanxy_out[32];
    assign wire_2127 = lut_tile_5_1_chanxy_out[33];
    assign wire_2129 = lut_tile_5_1_chanxy_out[34];
    assign wire_2131 = lut_tile_5_1_chanxy_out[35];
    assign wire_2133 = lut_tile_5_1_chanxy_out[36];
    assign wire_2135 = lut_tile_5_1_chanxy_out[37];
    assign wire_2137 = lut_tile_5_1_chanxy_out[38];
    assign wire_2139 = lut_tile_5_1_chanxy_out[39];
    assign wire_2140 = lut_tile_5_1_chanxy_out[40];
    assign wire_2141 = lut_tile_5_1_chanxy_out[41];
    assign wire_2142 = lut_tile_5_1_chanxy_out[42];
    assign wire_2143 = lut_tile_5_1_chanxy_out[43];
    assign wire_2144 = lut_tile_5_1_chanxy_out[44];
    assign wire_2145 = lut_tile_5_1_chanxy_out[45];
    assign wire_2146 = lut_tile_5_1_chanxy_out[46];
    assign wire_2147 = lut_tile_5_1_chanxy_out[47];
    assign wire_2148 = lut_tile_5_1_chanxy_out[48];
    assign wire_2149 = lut_tile_5_1_chanxy_out[49];
   // CHANXY OUT
    assign lut_tile_5_2_chanxy_in = {wire_1969, wire_1948, wire_2186, wire_1881, wire_1871, wire_1870, wire_1861, wire_1860, wire_1847, wire_1846, wire_1842, wire_1921, wire_1920, wire_2178, wire_1889, wire_1873, wire_1872, wire_1869, wire_1868, wire_1855, wire_1854, wire_1850, wire_805, wire_1967, wire_1940, wire_2170, wire_1887, wire_1879, wire_1878, wire_1858, wire_1853, wire_1852, wire_1839, wire_1838, wire_805, wire_1951, wire_1950, wire_2162, wire_1885, wire_1875, wire_1874, wire_1866, wire_1863, wire_1862, wire_1837, wire_1836, wire_601, wire_1955, wire_1954, wire_805, wire_2154, wire_1883, wire_1877, wire_1876, wire_1845, wire_1844, wire_1834, wire_1831, wire_1830, wire_601, wire_1963, wire_1924, wire_1919, wire_1918, wire_1961, wire_1916, wire_1935, wire_1934, wire_1929, wire_1928, wire_601, wire_1953, wire_1952, wire_1945, wire_1944, wire_1957, wire_1956, wire_1965, wire_1932, wire_1911, wire_1910, wire_601, wire_1927, wire_1926, wire_1959, wire_1958, wire_1943, wire_1942, wire_1937, wire_1936, wire_1913, wire_1912, wire_805, wire_2144, wire_2132, wire_2128, wire_2116, wire_1946, wire_647, wire_638, wire_632, wire_2146, wire_2134, wire_2120, wire_2118, wire_1938, wire_644, wire_638, wire_629, wire_2148, wire_2136, wire_2122, wire_2110, wire_1930, wire_650, wire_644, wire_635, wire_629, wire_2140, wire_2138, wire_2124, wire_2112, wire_1922, wire_650, wire_641, wire_635, wire_600, wire_2142, wire_2130, wire_2126, wire_2114, wire_1914, wire_647, wire_641, wire_632, wire_600, wire_2226, wire_2214, wire_2202, wire_2198, wire_1969, wire_647, wire_638, wire_632, wire_2228, wire_2216, wire_2204, wire_2190, wire_1967, wire_644, wire_638, wire_629, wire_2220, wire_2218, wire_2206, wire_2192, wire_1965, wire_650, wire_644, wire_635, wire_629, wire_2222, wire_2210, wire_2208, wire_2194, wire_1963, wire_650, wire_641, wire_635, wire_600, wire_2224, wire_2212, wire_2200, wire_2196, wire_1961, wire_647, wire_641, wire_632, wire_600};
    // CHNAXY TOTAL: 179
    assign wire_1917 = lut_tile_5_2_chanxy_out[0];
    assign wire_1925 = lut_tile_5_2_chanxy_out[1];
    assign wire_1933 = lut_tile_5_2_chanxy_out[2];
    assign wire_1941 = lut_tile_5_2_chanxy_out[3];
    assign wire_1949 = lut_tile_5_2_chanxy_out[4];
    assign wire_1950 = lut_tile_5_2_chanxy_out[5];
    assign wire_1952 = lut_tile_5_2_chanxy_out[6];
    assign wire_1954 = lut_tile_5_2_chanxy_out[7];
    assign wire_1956 = lut_tile_5_2_chanxy_out[8];
    assign wire_1958 = lut_tile_5_2_chanxy_out[9];
    assign wire_2191 = lut_tile_5_2_chanxy_out[10];
    assign wire_2193 = lut_tile_5_2_chanxy_out[11];
    assign wire_2195 = lut_tile_5_2_chanxy_out[12];
    assign wire_2197 = lut_tile_5_2_chanxy_out[13];
    assign wire_2199 = lut_tile_5_2_chanxy_out[14];
    assign wire_2201 = lut_tile_5_2_chanxy_out[15];
    assign wire_2203 = lut_tile_5_2_chanxy_out[16];
    assign wire_2205 = lut_tile_5_2_chanxy_out[17];
    assign wire_2207 = lut_tile_5_2_chanxy_out[18];
    assign wire_2209 = lut_tile_5_2_chanxy_out[19];
    assign wire_2211 = lut_tile_5_2_chanxy_out[20];
    assign wire_2213 = lut_tile_5_2_chanxy_out[21];
    assign wire_2215 = lut_tile_5_2_chanxy_out[22];
    assign wire_2217 = lut_tile_5_2_chanxy_out[23];
    assign wire_2219 = lut_tile_5_2_chanxy_out[24];
    assign wire_2220 = lut_tile_5_2_chanxy_out[25];
    assign wire_2221 = lut_tile_5_2_chanxy_out[26];
    assign wire_2222 = lut_tile_5_2_chanxy_out[27];
    assign wire_2223 = lut_tile_5_2_chanxy_out[28];
    assign wire_2224 = lut_tile_5_2_chanxy_out[29];
    assign wire_2225 = lut_tile_5_2_chanxy_out[30];
    assign wire_2226 = lut_tile_5_2_chanxy_out[31];
    assign wire_2227 = lut_tile_5_2_chanxy_out[32];
    assign wire_2228 = lut_tile_5_2_chanxy_out[33];
    assign wire_2229 = lut_tile_5_2_chanxy_out[34];
   // CHANXY OUT
    assign lut_tile_5_3_chanxy_in = {wire_1975, wire_1926, wire_2268, wire_1891, wire_1881, wire_1880, wire_1875, wire_1874, wire_1863, wire_1862, wire_1844, wire_1959, wire_1958, wire_2260, wire_1899, wire_1887, wire_1886, wire_1871, wire_1870, wire_1852, wire_1847, wire_1846, wire_1011, wire_1979, wire_1942, wire_2252, wire_1897, wire_1883, wire_1882, wire_1877, wire_1876, wire_1860, wire_1831, wire_1830, wire_1011, wire_1937, wire_1936, wire_2244, wire_1895, wire_1889, wire_1888, wire_1873, wire_1872, wire_1868, wire_1855, wire_1854, wire_807, wire_1913, wire_1912, wire_1011, wire_2236, wire_1893, wire_1885, wire_1884, wire_1879, wire_1878, wire_1839, wire_1838, wire_1836, wire_807, wire_1969, wire_1968, wire_1921, wire_1920, wire_1967, wire_1966, wire_1951, wire_1950, wire_1955, wire_1954, wire_1011, wire_1963, wire_1962, wire_1973, wire_1918, wire_1961, wire_1960, wire_1977, wire_1934, wire_1929, wire_1928, wire_807, wire_1953, wire_1952, wire_1945, wire_1944, wire_1957, wire_1956, wire_1965, wire_1964, wire_1971, wire_1910, wire_807, wire_2226, wire_2214, wire_2202, wire_2198, wire_1948, wire_853, wire_844, wire_838, wire_2228, wire_2216, wire_2204, wire_2190, wire_1940, wire_850, wire_844, wire_835, wire_2220, wire_2218, wire_2206, wire_2192, wire_1932, wire_856, wire_850, wire_841, wire_835, wire_2222, wire_2210, wire_2208, wire_2194, wire_1924, wire_856, wire_847, wire_841, wire_806, wire_2224, wire_2212, wire_2200, wire_2196, wire_1916, wire_853, wire_847, wire_838, wire_806, wire_2308, wire_2296, wire_2284, wire_2272, wire_1979, wire_853, wire_844, wire_838, wire_2300, wire_2298, wire_2286, wire_2274, wire_1977, wire_850, wire_844, wire_835, wire_2302, wire_2290, wire_2288, wire_2276, wire_1975, wire_856, wire_850, wire_841, wire_835, wire_2304, wire_2292, wire_2280, wire_2278, wire_1973, wire_856, wire_847, wire_841, wire_806, wire_2306, wire_2294, wire_2282, wire_2270, wire_1971, wire_853, wire_847, wire_838, wire_806};
    // CHNAXY TOTAL: 179
    assign wire_1911 = lut_tile_5_3_chanxy_out[0];
    assign wire_1919 = lut_tile_5_3_chanxy_out[1];
    assign wire_1927 = lut_tile_5_3_chanxy_out[2];
    assign wire_1935 = lut_tile_5_3_chanxy_out[3];
    assign wire_1943 = lut_tile_5_3_chanxy_out[4];
    assign wire_1960 = lut_tile_5_3_chanxy_out[5];
    assign wire_1962 = lut_tile_5_3_chanxy_out[6];
    assign wire_1964 = lut_tile_5_3_chanxy_out[7];
    assign wire_1966 = lut_tile_5_3_chanxy_out[8];
    assign wire_1968 = lut_tile_5_3_chanxy_out[9];
    assign wire_2271 = lut_tile_5_3_chanxy_out[10];
    assign wire_2273 = lut_tile_5_3_chanxy_out[11];
    assign wire_2275 = lut_tile_5_3_chanxy_out[12];
    assign wire_2277 = lut_tile_5_3_chanxy_out[13];
    assign wire_2279 = lut_tile_5_3_chanxy_out[14];
    assign wire_2281 = lut_tile_5_3_chanxy_out[15];
    assign wire_2283 = lut_tile_5_3_chanxy_out[16];
    assign wire_2285 = lut_tile_5_3_chanxy_out[17];
    assign wire_2287 = lut_tile_5_3_chanxy_out[18];
    assign wire_2289 = lut_tile_5_3_chanxy_out[19];
    assign wire_2291 = lut_tile_5_3_chanxy_out[20];
    assign wire_2293 = lut_tile_5_3_chanxy_out[21];
    assign wire_2295 = lut_tile_5_3_chanxy_out[22];
    assign wire_2297 = lut_tile_5_3_chanxy_out[23];
    assign wire_2299 = lut_tile_5_3_chanxy_out[24];
    assign wire_2300 = lut_tile_5_3_chanxy_out[25];
    assign wire_2301 = lut_tile_5_3_chanxy_out[26];
    assign wire_2302 = lut_tile_5_3_chanxy_out[27];
    assign wire_2303 = lut_tile_5_3_chanxy_out[28];
    assign wire_2304 = lut_tile_5_3_chanxy_out[29];
    assign wire_2305 = lut_tile_5_3_chanxy_out[30];
    assign wire_2306 = lut_tile_5_3_chanxy_out[31];
    assign wire_2307 = lut_tile_5_3_chanxy_out[32];
    assign wire_2308 = lut_tile_5_3_chanxy_out[33];
    assign wire_2309 = lut_tile_5_3_chanxy_out[34];
   // CHANXY OUT
    assign lut_tile_5_4_chanxy_in = {wire_1953, wire_1952, wire_2342, wire_1901, wire_1891, wire_1890, wire_1885, wire_1884, wire_1879, wire_1878, wire_1838, wire_1989, wire_1944, wire_2334, wire_1909, wire_1897, wire_1896, wire_1881, wire_1880, wire_1875, wire_1874, wire_1846, wire_1217, wire_1957, wire_1956, wire_2326, wire_1907, wire_1893, wire_1892, wire_1887, wire_1886, wire_1871, wire_1870, wire_1854, wire_1217, wire_1965, wire_1964, wire_2318, wire_1905, wire_1899, wire_1898, wire_1883, wire_1882, wire_1877, wire_1876, wire_1862, wire_1013, wire_1971, wire_1970, wire_1013, wire_2310, wire_1903, wire_1895, wire_1894, wire_1889, wire_1888, wire_1873, wire_1872, wire_1830, wire_1013, wire_1975, wire_1974, wire_1959, wire_1958, wire_1979, wire_1978, wire_1987, wire_1936, wire_1981, wire_1912, wire_1217, wire_1969, wire_1968, wire_1983, wire_1920, wire_1967, wire_1966, wire_1951, wire_1950, wire_1955, wire_1954, wire_1217, wire_1963, wire_1962, wire_1973, wire_1972, wire_1961, wire_1960, wire_1977, wire_1976, wire_1985, wire_1928, wire_1013, wire_2308, wire_2296, wire_2284, wire_2272, wire_1942, wire_1059, wire_1050, wire_1044, wire_2300, wire_2298, wire_2286, wire_2274, wire_1934, wire_1056, wire_1050, wire_1041, wire_2302, wire_2290, wire_2288, wire_2276, wire_1926, wire_1062, wire_1056, wire_1047, wire_1041, wire_2304, wire_2292, wire_2280, wire_2278, wire_1918, wire_1062, wire_1053, wire_1047, wire_1012, wire_2306, wire_2294, wire_2282, wire_2270, wire_1910, wire_1059, wire_1053, wire_1044, wire_1012, wire_2382, wire_2378, wire_2366, wire_2354, wire_1989, wire_1059, wire_1050, wire_1044, wire_2384, wire_2370, wire_2368, wire_2356, wire_1987, wire_1056, wire_1050, wire_1041, wire_2386, wire_2372, wire_2360, wire_2358, wire_1985, wire_1062, wire_1056, wire_1047, wire_1041, wire_2388, wire_2374, wire_2362, wire_2350, wire_1983, wire_1062, wire_1053, wire_1047, wire_1012, wire_2380, wire_2376, wire_2364, wire_2352, wire_1981, wire_1059, wire_1053, wire_1044, wire_1012};
    // CHNAXY TOTAL: 179
    assign wire_1913 = lut_tile_5_4_chanxy_out[0];
    assign wire_1921 = lut_tile_5_4_chanxy_out[1];
    assign wire_1929 = lut_tile_5_4_chanxy_out[2];
    assign wire_1937 = lut_tile_5_4_chanxy_out[3];
    assign wire_1945 = lut_tile_5_4_chanxy_out[4];
    assign wire_1970 = lut_tile_5_4_chanxy_out[5];
    assign wire_1972 = lut_tile_5_4_chanxy_out[6];
    assign wire_1974 = lut_tile_5_4_chanxy_out[7];
    assign wire_1976 = lut_tile_5_4_chanxy_out[8];
    assign wire_1978 = lut_tile_5_4_chanxy_out[9];
    assign wire_2351 = lut_tile_5_4_chanxy_out[10];
    assign wire_2353 = lut_tile_5_4_chanxy_out[11];
    assign wire_2355 = lut_tile_5_4_chanxy_out[12];
    assign wire_2357 = lut_tile_5_4_chanxy_out[13];
    assign wire_2359 = lut_tile_5_4_chanxy_out[14];
    assign wire_2361 = lut_tile_5_4_chanxy_out[15];
    assign wire_2363 = lut_tile_5_4_chanxy_out[16];
    assign wire_2365 = lut_tile_5_4_chanxy_out[17];
    assign wire_2367 = lut_tile_5_4_chanxy_out[18];
    assign wire_2369 = lut_tile_5_4_chanxy_out[19];
    assign wire_2371 = lut_tile_5_4_chanxy_out[20];
    assign wire_2373 = lut_tile_5_4_chanxy_out[21];
    assign wire_2375 = lut_tile_5_4_chanxy_out[22];
    assign wire_2377 = lut_tile_5_4_chanxy_out[23];
    assign wire_2379 = lut_tile_5_4_chanxy_out[24];
    assign wire_2380 = lut_tile_5_4_chanxy_out[25];
    assign wire_2381 = lut_tile_5_4_chanxy_out[26];
    assign wire_2382 = lut_tile_5_4_chanxy_out[27];
    assign wire_2383 = lut_tile_5_4_chanxy_out[28];
    assign wire_2384 = lut_tile_5_4_chanxy_out[29];
    assign wire_2385 = lut_tile_5_4_chanxy_out[30];
    assign wire_2386 = lut_tile_5_4_chanxy_out[31];
    assign wire_2387 = lut_tile_5_4_chanxy_out[32];
    assign wire_2388 = lut_tile_5_4_chanxy_out[33];
    assign wire_2389 = lut_tile_5_4_chanxy_out[34];
   // CHANXY OUT
    assign lut_tile_5_5_chanxy_in = {wire_1958, wire_1508, wire_2424, wire_1902, wire_1898, wire_1886, wire_1874, wire_1505, wire_1496, wire_1490, wire_1956, wire_1502, wire_2416, wire_1904, wire_1890, wire_1888, wire_1876, wire_1502, wire_1496, wire_1487, wire_1954, wire_1496, wire_2408, wire_1906, wire_1892, wire_1880, wire_1878, wire_1508, wire_1502, wire_1493, wire_1487, wire_1952, wire_1490, wire_2400, wire_1908, wire_1894, wire_1882, wire_1870, wire_1508, wire_1499, wire_1493, wire_1219, wire_1950, wire_1219, wire_2392, wire_1900, wire_1896, wire_1884, wire_1872, wire_1505, wire_1499, wire_1490, wire_1219, wire_1988, wire_1508, wire_1986, wire_1502, wire_1984, wire_1496, wire_1982, wire_1490, wire_1980, wire_1219, wire_1970, wire_1978, wire_1505, wire_1976, wire_1499, wire_1974, wire_1493, wire_1972, wire_1487, wire_1968, wire_1966, wire_1505, wire_1964, wire_1499, wire_1962, wire_1493, wire_1960, wire_1487, wire_2458, wire_1268, wire_2382, wire_2378, wire_2366, wire_2354, wire_1944, wire_1265, wire_1256, wire_1250, wire_2456, wire_1262, wire_2384, wire_2370, wire_2368, wire_2356, wire_1936, wire_1262, wire_1256, wire_1247, wire_2454, wire_1256, wire_2386, wire_2372, wire_2360, wire_2358, wire_1928, wire_1268, wire_1262, wire_1253, wire_1247, wire_2452, wire_1250, wire_2388, wire_2374, wire_2362, wire_2350, wire_1920, wire_1268, wire_1259, wire_1253, wire_1218, wire_2450, wire_1218, wire_2380, wire_2376, wire_2364, wire_2352, wire_1912, wire_1265, wire_1259, wire_1250, wire_1218, wire_2446, wire_1268, wire_2444, wire_1262, wire_2442, wire_1256, wire_2440, wire_1250, wire_2448, wire_1218, wire_2438, wire_2436, wire_1265, wire_2434, wire_1259, wire_2432, wire_1253, wire_2430, wire_1247, wire_2468, wire_2466, wire_1265, wire_2464, wire_1259, wire_2462, wire_1253, wire_2460, wire_1247};
    // CHNAXY TOTAL: 162
    assign wire_1951 = lut_tile_5_5_chanxy_out[0];
    assign wire_1953 = lut_tile_5_5_chanxy_out[1];
    assign wire_1955 = lut_tile_5_5_chanxy_out[2];
    assign wire_1957 = lut_tile_5_5_chanxy_out[3];
    assign wire_1959 = lut_tile_5_5_chanxy_out[4];
    assign wire_1961 = lut_tile_5_5_chanxy_out[5];
    assign wire_1963 = lut_tile_5_5_chanxy_out[6];
    assign wire_1965 = lut_tile_5_5_chanxy_out[7];
    assign wire_1967 = lut_tile_5_5_chanxy_out[8];
    assign wire_1969 = lut_tile_5_5_chanxy_out[9];
    assign wire_1971 = lut_tile_5_5_chanxy_out[10];
    assign wire_1973 = lut_tile_5_5_chanxy_out[11];
    assign wire_1975 = lut_tile_5_5_chanxy_out[12];
    assign wire_1977 = lut_tile_5_5_chanxy_out[13];
    assign wire_1979 = lut_tile_5_5_chanxy_out[14];
    assign wire_1980 = lut_tile_5_5_chanxy_out[15];
    assign wire_1981 = lut_tile_5_5_chanxy_out[16];
    assign wire_1982 = lut_tile_5_5_chanxy_out[17];
    assign wire_1983 = lut_tile_5_5_chanxy_out[18];
    assign wire_1984 = lut_tile_5_5_chanxy_out[19];
    assign wire_1985 = lut_tile_5_5_chanxy_out[20];
    assign wire_1986 = lut_tile_5_5_chanxy_out[21];
    assign wire_1987 = lut_tile_5_5_chanxy_out[22];
    assign wire_1988 = lut_tile_5_5_chanxy_out[23];
    assign wire_1989 = lut_tile_5_5_chanxy_out[24];
    assign wire_2431 = lut_tile_5_5_chanxy_out[25];
    assign wire_2433 = lut_tile_5_5_chanxy_out[26];
    assign wire_2435 = lut_tile_5_5_chanxy_out[27];
    assign wire_2437 = lut_tile_5_5_chanxy_out[28];
    assign wire_2439 = lut_tile_5_5_chanxy_out[29];
    assign wire_2441 = lut_tile_5_5_chanxy_out[30];
    assign wire_2443 = lut_tile_5_5_chanxy_out[31];
    assign wire_2445 = lut_tile_5_5_chanxy_out[32];
    assign wire_2447 = lut_tile_5_5_chanxy_out[33];
    assign wire_2449 = lut_tile_5_5_chanxy_out[34];
    assign wire_2451 = lut_tile_5_5_chanxy_out[35];
    assign wire_2453 = lut_tile_5_5_chanxy_out[36];
    assign wire_2455 = lut_tile_5_5_chanxy_out[37];
    assign wire_2457 = lut_tile_5_5_chanxy_out[38];
    assign wire_2459 = lut_tile_5_5_chanxy_out[39];
    assign wire_2460 = lut_tile_5_5_chanxy_out[40];
    assign wire_2461 = lut_tile_5_5_chanxy_out[41];
    assign wire_2462 = lut_tile_5_5_chanxy_out[42];
    assign wire_2463 = lut_tile_5_5_chanxy_out[43];
    assign wire_2464 = lut_tile_5_5_chanxy_out[44];
    assign wire_2465 = lut_tile_5_5_chanxy_out[45];
    assign wire_2466 = lut_tile_5_5_chanxy_out[46];
    assign wire_2467 = lut_tile_5_5_chanxy_out[47];
    assign wire_2468 = lut_tile_5_5_chanxy_out[48];
    assign wire_2469 = lut_tile_5_5_chanxy_out[49];
   // CHANXY OUT
    // FPGA IO IPIN
    assign io_tile_1_0_ipin_in = {wire_2029, wire_2028, wire_2009, wire_2008, wire_2025, wire_2024, wire_2005, wire_2004, wire_2023, wire_2022, wire_2003, wire_2002, wire_2021, wire_2020, wire_2001, wire_2000, wire_2019, wire_2018, wire_1999, wire_1998, wire_2015, wire_2014, wire_1995, wire_1994, wire_2013, wire_2012, wire_1993, wire_1992, wire_2011, wire_2010, wire_1991, wire_1990};
    // FPGA IPIN IN
    assign io_tile_2_0_ipin_in = {wire_2027, wire_2026, wire_2007, wire_2006, wire_2023, wire_2022, wire_2003, wire_2002, wire_2033, wire_2032, wire_2029, wire_2028, wire_2019, wire_2018, wire_1999, wire_1998, wire_2037, wire_2036, wire_2005, wire_2004, wire_2031, wire_2030, wire_2021, wire_2020, wire_2011, wire_2010, wire_1991, wire_1990, wire_2035, wire_2034, wire_1997, wire_1996};
    // FPGA IPIN IN
    assign io_tile_3_0_ipin_in = {wire_2039, wire_2038, wire_2013, wire_2012, wire_2033, wire_2032, wire_2029, wire_2028, wire_2049, wire_2048, wire_1999, wire_1998, wire_2037, wire_2036, wire_2005, wire_2004, wire_2043, wire_2042, wire_2015, wire_2014, wire_2047, wire_2046, wire_1991, wire_1990, wire_2035, wire_2034, wire_1997, wire_1996, wire_2041, wire_2040, wire_2007, wire_2006};
    // FPGA IPIN IN
    assign io_tile_4_0_ipin_in = {wire_2045, wire_2044, wire_2023, wire_2022, wire_2049, wire_2048, wire_1999, wire_1998, wire_2053, wire_2052, wire_2039, wire_2038, wire_2043, wire_2042, wire_2015, wire_2014, wire_2057, wire_2056, wire_2033, wire_2032, wire_2051, wire_2050, wire_2037, wire_2036, wire_2041, wire_2040, wire_2007, wire_2006, wire_2055, wire_2054, wire_2031, wire_2030};
    // FPGA IPIN IN
    assign io_tile_5_0_ipin_in = {wire_2059, wire_2058, wire_2035, wire_2034, wire_2053, wire_2052, wire_2039, wire_2038, wire_2069, wire_2068, wire_2043, wire_2042, wire_2057, wire_2056, wire_2033, wire_2032, wire_2063, wire_2062, wire_2047, wire_2046, wire_2067, wire_2066, wire_2041, wire_2040, wire_2055, wire_2054, wire_2031, wire_2030, wire_2061, wire_2060, wire_2045, wire_2044};
    // FPGA IPIN IN
    assign io_tile_1_6_ipin_in = {wire_2427, wire_2426, wire_2407, wire_2406, wire_2425, wire_2424, wire_2413, wire_2412, wire_2423, wire_2422, wire_2403, wire_2402, wire_2419, wire_2418, wire_2399, wire_2398, wire_2417, wire_2416, wire_2405, wire_2404, wire_2415, wire_2414, wire_2395, wire_2394, wire_2421, wire_2420, wire_2393, wire_2392, wire_2409, wire_2408, wire_2397, wire_2396};
    // FPGA IPIN IN
    assign io_tile_2_6_ipin_in = {wire_2425, wire_2424, wire_2413, wire_2412, wire_2435, wire_2434, wire_2423, wire_2422, wire_2429, wire_2428, wire_2401, wire_2400, wire_2417, wire_2416, wire_2405, wire_2404, wire_2433, wire_2432, wire_2415, wire_2414, wire_2421, wire_2420, wire_2393, wire_2392, wire_2437, wire_2436, wire_2391, wire_2390, wire_2431, wire_2430, wire_2407, wire_2406};
    // FPGA IPIN IN
    assign io_tile_3_6_ipin_in = {wire_2435, wire_2434, wire_2423, wire_2422, wire_2449, wire_2448, wire_2409, wire_2408, wire_2439, wire_2438, wire_2399, wire_2398, wire_2433, wire_2432, wire_2415, wire_2414, wire_2447, wire_2446, wire_2401, wire_2400, wire_2437, wire_2436, wire_2391, wire_2390, wire_2441, wire_2440, wire_2417, wire_2416, wire_2445, wire_2444, wire_2393, wire_2392};
    // FPGA IPIN IN
    assign io_tile_4_6_ipin_in = {wire_2449, wire_2448, wire_2409, wire_2408, wire_2455, wire_2454, wire_2439, wire_2438, wire_2443, wire_2442, wire_2425, wire_2424, wire_2447, wire_2446, wire_2401, wire_2400, wire_2453, wire_2452, wire_2437, wire_2436, wire_2441, wire_2440, wire_2417, wire_2416, wire_2457, wire_2456, wire_2431, wire_2430, wire_2451, wire_2450, wire_2435, wire_2434};
    // FPGA IPIN IN
    assign io_tile_5_6_ipin_in = {wire_2455, wire_2454, wire_2439, wire_2438, wire_2469, wire_2468, wire_2445, wire_2444, wire_2459, wire_2458, wire_2433, wire_2432, wire_2453, wire_2452, wire_2437, wire_2436, wire_2467, wire_2466, wire_2443, wire_2442, wire_2457, wire_2456, wire_2431, wire_2430, wire_2461, wire_2460, wire_2447, wire_2446, wire_2465, wire_2464, wire_2441, wire_2440};
    // FPGA IPIN IN
    assign io_tile_0_1_ipin_in = {wire_1547, wire_1546, wire_1527, wire_1526, wire_1545, wire_1544, wire_1525, wire_1524, wire_1543, wire_1542, wire_1523, wire_1522, wire_1541, wire_1540, wire_1521, wire_1520, wire_1537, wire_1536, wire_1517, wire_1516, wire_1535, wire_1534, wire_1515, wire_1514, wire_1533, wire_1532, wire_1513, wire_1512, wire_1531, wire_1530, wire_1511, wire_1510};
    // FPGA IPIN IN
    assign io_tile_0_2_ipin_in = {wire_1559, wire_1558, wire_1533, wire_1532, wire_1543, wire_1542, wire_1523, wire_1522, wire_1553, wire_1552, wire_1549, wire_1548, wire_1539, wire_1538, wire_1519, wire_1518, wire_1535, wire_1534, wire_1515, wire_1514, wire_1551, wire_1550, wire_1541, wire_1540, wire_1531, wire_1530, wire_1511, wire_1510, wire_1555, wire_1554, wire_1517, wire_1516};
    // FPGA IPIN IN
    assign io_tile_0_3_ipin_in = {wire_1565, wire_1564, wire_1543, wire_1542, wire_1553, wire_1552, wire_1549, wire_1548, wire_1569, wire_1568, wire_1519, wire_1518, wire_1557, wire_1556, wire_1525, wire_1524, wire_1551, wire_1550, wire_1541, wire_1540, wire_1567, wire_1566, wire_1511, wire_1510, wire_1555, wire_1554, wire_1517, wire_1516, wire_1561, wire_1560, wire_1527, wire_1526};
    // FPGA IPIN IN
    assign io_tile_0_4_ipin_in = {wire_1579, wire_1578, wire_1555, wire_1554, wire_1569, wire_1568, wire_1519, wire_1518, wire_1573, wire_1572, wire_1559, wire_1558, wire_1563, wire_1562, wire_1535, wire_1534, wire_1567, wire_1566, wire_1511, wire_1510, wire_1571, wire_1570, wire_1557, wire_1556, wire_1561, wire_1560, wire_1527, wire_1526, wire_1575, wire_1574, wire_1551, wire_1550};
    // FPGA IPIN IN
    assign io_tile_0_5_ipin_in = {wire_1585, wire_1584, wire_1569, wire_1568, wire_1573, wire_1572, wire_1559, wire_1558, wire_1589, wire_1588, wire_1563, wire_1562, wire_1577, wire_1576, wire_1553, wire_1552, wire_1571, wire_1570, wire_1557, wire_1556, wire_1587, wire_1586, wire_1561, wire_1560, wire_1575, wire_1574, wire_1551, wire_1550, wire_1581, wire_1580, wire_1565, wire_1564};
    // FPGA IPIN IN
    assign io_tile_6_1_ipin_in = {wire_1947, wire_1946, wire_1927, wire_1926, wire_1945, wire_1944, wire_1933, wire_1932, wire_1949, wire_1948, wire_1921, wire_1920, wire_1939, wire_1938, wire_1919, wire_1918, wire_1937, wire_1936, wire_1925, wire_1924, wire_1935, wire_1934, wire_1915, wire_1914, wire_1931, wire_1930, wire_1911, wire_1910, wire_1929, wire_1928, wire_1917, wire_1916};
    // FPGA IPIN IN
    assign io_tile_6_2_ipin_in = {wire_1945, wire_1944, wire_1933, wire_1932, wire_1955, wire_1954, wire_1943, wire_1942, wire_1959, wire_1958, wire_1919, wire_1918, wire_1937, wire_1936, wire_1925, wire_1924, wire_1953, wire_1952, wire_1935, wire_1934, wire_1941, wire_1940, wire_1913, wire_1912, wire_1929, wire_1928, wire_1917, wire_1916, wire_1951, wire_1950, wire_1927, wire_1926};
    // FPGA IPIN IN
    assign io_tile_6_3_ipin_in = {wire_1955, wire_1954, wire_1943, wire_1942, wire_1969, wire_1968, wire_1929, wire_1928, wire_1963, wire_1962, wire_1945, wire_1944, wire_1953, wire_1952, wire_1935, wire_1934, wire_1967, wire_1966, wire_1921, wire_1920, wire_1957, wire_1956, wire_1911, wire_1910, wire_1951, wire_1950, wire_1927, wire_1926, wire_1965, wire_1964, wire_1913, wire_1912};
    // FPGA IPIN IN
    assign io_tile_6_4_ipin_in = {wire_1969, wire_1968, wire_1929, wire_1928, wire_1975, wire_1974, wire_1959, wire_1958, wire_1979, wire_1978, wire_1953, wire_1952, wire_1967, wire_1966, wire_1921, wire_1920, wire_1973, wire_1972, wire_1957, wire_1956, wire_1961, wire_1960, wire_1937, wire_1936, wire_1965, wire_1964, wire_1913, wire_1912, wire_1971, wire_1970, wire_1955, wire_1954};
    // FPGA IPIN IN
    assign io_tile_6_5_ipin_in = {wire_1975, wire_1974, wire_1959, wire_1958, wire_1989, wire_1988, wire_1965, wire_1964, wire_1983, wire_1982, wire_1969, wire_1968, wire_1973, wire_1972, wire_1957, wire_1956, wire_1987, wire_1986, wire_1963, wire_1962, wire_1977, wire_1976, wire_1951, wire_1950, wire_1971, wire_1970, wire_1955, wire_1954, wire_1985, wire_1984, wire_1961, wire_1960};
    // FPGA IPIN IN


    // FPGA IO OPIN
    assign wire_25 = io_tile_1_0_opin_out[0];
    assign wire_28 = io_tile_1_0_opin_out[1];
    assign wire_31 = io_tile_1_0_opin_out[2];
    assign wire_34 = io_tile_1_0_opin_out[3];
    assign wire_37 = io_tile_1_0_opin_out[4];
    assign wire_40 = io_tile_1_0_opin_out[5];
    assign wire_43 = io_tile_1_0_opin_out[6];
    assign wire_46 = io_tile_1_0_opin_out[7];
    assign wire_73 = io_tile_2_0_opin_out[0];
    assign wire_76 = io_tile_2_0_opin_out[1];
    assign wire_79 = io_tile_2_0_opin_out[2];
    assign wire_82 = io_tile_2_0_opin_out[3];
    assign wire_85 = io_tile_2_0_opin_out[4];
    assign wire_88 = io_tile_2_0_opin_out[5];
    assign wire_91 = io_tile_2_0_opin_out[6];
    assign wire_94 = io_tile_2_0_opin_out[7];
    assign wire_121 = io_tile_3_0_opin_out[0];
    assign wire_124 = io_tile_3_0_opin_out[1];
    assign wire_127 = io_tile_3_0_opin_out[2];
    assign wire_130 = io_tile_3_0_opin_out[3];
    assign wire_133 = io_tile_3_0_opin_out[4];
    assign wire_136 = io_tile_3_0_opin_out[5];
    assign wire_139 = io_tile_3_0_opin_out[6];
    assign wire_142 = io_tile_3_0_opin_out[7];
    assign wire_169 = io_tile_4_0_opin_out[0];
    assign wire_172 = io_tile_4_0_opin_out[1];
    assign wire_175 = io_tile_4_0_opin_out[2];
    assign wire_178 = io_tile_4_0_opin_out[3];
    assign wire_181 = io_tile_4_0_opin_out[4];
    assign wire_184 = io_tile_4_0_opin_out[5];
    assign wire_187 = io_tile_4_0_opin_out[6];
    assign wire_190 = io_tile_4_0_opin_out[7];
    assign wire_217 = io_tile_5_0_opin_out[0];
    assign wire_220 = io_tile_5_0_opin_out[1];
    assign wire_223 = io_tile_5_0_opin_out[2];
    assign wire_226 = io_tile_5_0_opin_out[3];
    assign wire_229 = io_tile_5_0_opin_out[4];
    assign wire_232 = io_tile_5_0_opin_out[5];
    assign wire_235 = io_tile_5_0_opin_out[6];
    assign wire_238 = io_tile_5_0_opin_out[7];
    assign wire_1295 = io_tile_1_6_opin_out[0];
    assign wire_1298 = io_tile_1_6_opin_out[1];
    assign wire_1301 = io_tile_1_6_opin_out[2];
    assign wire_1304 = io_tile_1_6_opin_out[3];
    assign wire_1307 = io_tile_1_6_opin_out[4];
    assign wire_1310 = io_tile_1_6_opin_out[5];
    assign wire_1313 = io_tile_1_6_opin_out[6];
    assign wire_1316 = io_tile_1_6_opin_out[7];
    assign wire_1343 = io_tile_2_6_opin_out[0];
    assign wire_1346 = io_tile_2_6_opin_out[1];
    assign wire_1349 = io_tile_2_6_opin_out[2];
    assign wire_1352 = io_tile_2_6_opin_out[3];
    assign wire_1355 = io_tile_2_6_opin_out[4];
    assign wire_1358 = io_tile_2_6_opin_out[5];
    assign wire_1361 = io_tile_2_6_opin_out[6];
    assign wire_1364 = io_tile_2_6_opin_out[7];
    assign wire_1391 = io_tile_3_6_opin_out[0];
    assign wire_1394 = io_tile_3_6_opin_out[1];
    assign wire_1397 = io_tile_3_6_opin_out[2];
    assign wire_1400 = io_tile_3_6_opin_out[3];
    assign wire_1403 = io_tile_3_6_opin_out[4];
    assign wire_1406 = io_tile_3_6_opin_out[5];
    assign wire_1409 = io_tile_3_6_opin_out[6];
    assign wire_1412 = io_tile_3_6_opin_out[7];
    assign wire_1439 = io_tile_4_6_opin_out[0];
    assign wire_1442 = io_tile_4_6_opin_out[1];
    assign wire_1445 = io_tile_4_6_opin_out[2];
    assign wire_1448 = io_tile_4_6_opin_out[3];
    assign wire_1451 = io_tile_4_6_opin_out[4];
    assign wire_1454 = io_tile_4_6_opin_out[5];
    assign wire_1457 = io_tile_4_6_opin_out[6];
    assign wire_1460 = io_tile_4_6_opin_out[7];
    assign wire_1487 = io_tile_5_6_opin_out[0];
    assign wire_1490 = io_tile_5_6_opin_out[1];
    assign wire_1493 = io_tile_5_6_opin_out[2];
    assign wire_1496 = io_tile_5_6_opin_out[3];
    assign wire_1499 = io_tile_5_6_opin_out[4];
    assign wire_1502 = io_tile_5_6_opin_out[5];
    assign wire_1505 = io_tile_5_6_opin_out[6];
    assign wire_1508 = io_tile_5_6_opin_out[7];
    assign wire_265 = io_tile_0_1_opin_out[0];
    assign wire_268 = io_tile_0_1_opin_out[1];
    assign wire_271 = io_tile_0_1_opin_out[2];
    assign wire_274 = io_tile_0_1_opin_out[3];
    assign wire_277 = io_tile_0_1_opin_out[4];
    assign wire_280 = io_tile_0_1_opin_out[5];
    assign wire_283 = io_tile_0_1_opin_out[6];
    assign wire_286 = io_tile_0_1_opin_out[7];
    assign wire_471 = io_tile_0_2_opin_out[0];
    assign wire_474 = io_tile_0_2_opin_out[1];
    assign wire_477 = io_tile_0_2_opin_out[2];
    assign wire_480 = io_tile_0_2_opin_out[3];
    assign wire_483 = io_tile_0_2_opin_out[4];
    assign wire_486 = io_tile_0_2_opin_out[5];
    assign wire_489 = io_tile_0_2_opin_out[6];
    assign wire_492 = io_tile_0_2_opin_out[7];
    assign wire_677 = io_tile_0_3_opin_out[0];
    assign wire_680 = io_tile_0_3_opin_out[1];
    assign wire_683 = io_tile_0_3_opin_out[2];
    assign wire_686 = io_tile_0_3_opin_out[3];
    assign wire_689 = io_tile_0_3_opin_out[4];
    assign wire_692 = io_tile_0_3_opin_out[5];
    assign wire_695 = io_tile_0_3_opin_out[6];
    assign wire_698 = io_tile_0_3_opin_out[7];
    assign wire_883 = io_tile_0_4_opin_out[0];
    assign wire_886 = io_tile_0_4_opin_out[1];
    assign wire_889 = io_tile_0_4_opin_out[2];
    assign wire_892 = io_tile_0_4_opin_out[3];
    assign wire_895 = io_tile_0_4_opin_out[4];
    assign wire_898 = io_tile_0_4_opin_out[5];
    assign wire_901 = io_tile_0_4_opin_out[6];
    assign wire_904 = io_tile_0_4_opin_out[7];
    assign wire_1089 = io_tile_0_5_opin_out[0];
    assign wire_1092 = io_tile_0_5_opin_out[1];
    assign wire_1095 = io_tile_0_5_opin_out[2];
    assign wire_1098 = io_tile_0_5_opin_out[3];
    assign wire_1101 = io_tile_0_5_opin_out[4];
    assign wire_1104 = io_tile_0_5_opin_out[5];
    assign wire_1107 = io_tile_0_5_opin_out[6];
    assign wire_1110 = io_tile_0_5_opin_out[7];
    assign wire_423 = io_tile_6_1_opin_out[0];
    assign wire_426 = io_tile_6_1_opin_out[1];
    assign wire_429 = io_tile_6_1_opin_out[2];
    assign wire_432 = io_tile_6_1_opin_out[3];
    assign wire_435 = io_tile_6_1_opin_out[4];
    assign wire_438 = io_tile_6_1_opin_out[5];
    assign wire_441 = io_tile_6_1_opin_out[6];
    assign wire_444 = io_tile_6_1_opin_out[7];
    assign wire_629 = io_tile_6_2_opin_out[0];
    assign wire_632 = io_tile_6_2_opin_out[1];
    assign wire_635 = io_tile_6_2_opin_out[2];
    assign wire_638 = io_tile_6_2_opin_out[3];
    assign wire_641 = io_tile_6_2_opin_out[4];
    assign wire_644 = io_tile_6_2_opin_out[5];
    assign wire_647 = io_tile_6_2_opin_out[6];
    assign wire_650 = io_tile_6_2_opin_out[7];
    assign wire_835 = io_tile_6_3_opin_out[0];
    assign wire_838 = io_tile_6_3_opin_out[1];
    assign wire_841 = io_tile_6_3_opin_out[2];
    assign wire_844 = io_tile_6_3_opin_out[3];
    assign wire_847 = io_tile_6_3_opin_out[4];
    assign wire_850 = io_tile_6_3_opin_out[5];
    assign wire_853 = io_tile_6_3_opin_out[6];
    assign wire_856 = io_tile_6_3_opin_out[7];
    assign wire_1041 = io_tile_6_4_opin_out[0];
    assign wire_1044 = io_tile_6_4_opin_out[1];
    assign wire_1047 = io_tile_6_4_opin_out[2];
    assign wire_1050 = io_tile_6_4_opin_out[3];
    assign wire_1053 = io_tile_6_4_opin_out[4];
    assign wire_1056 = io_tile_6_4_opin_out[5];
    assign wire_1059 = io_tile_6_4_opin_out[6];
    assign wire_1062 = io_tile_6_4_opin_out[7];
    assign wire_1247 = io_tile_6_5_opin_out[0];
    assign wire_1250 = io_tile_6_5_opin_out[1];
    assign wire_1253 = io_tile_6_5_opin_out[2];
    assign wire_1256 = io_tile_6_5_opin_out[3];
    assign wire_1259 = io_tile_6_5_opin_out[4];
    assign wire_1262 = io_tile_6_5_opin_out[5];
    assign wire_1265 = io_tile_6_5_opin_out[6];
    assign wire_1268 = io_tile_6_5_opin_out[7];
    // FPGA IO CHANXY
    assign io_tile_1_0_chanxy_in = {wire_1511, wire_1549, wire_2039, wire_1629, wire_1619, wire_1609, wire_1599, wire_46, wire_37, wire_31, wire_1547, wire_305, wire_1545, wire_305, wire_1543, wire_46, wire_1541, wire_46, wire_2037, wire_1627, wire_1617, wire_1607, wire_1597, wire_43, wire_37, wire_28, wire_1539, wire_43, wire_1537, wire_43, wire_1535, wire_40, wire_1533, wire_40, wire_2035, wire_1625, wire_1615, wire_1605, wire_1595, wire_305, wire_43, wire_34, wire_28, wire_1531, wire_37, wire_1529, wire_37, wire_1527, wire_34, wire_1525, wire_34, wire_2033, wire_1623, wire_1613, wire_1603, wire_1593, wire_305, wire_40, wire_34, wire_25, wire_1523, wire_31, wire_1521, wire_31, wire_1519, wire_28, wire_1517, wire_28, wire_2031, wire_1621, wire_1611, wire_1601, wire_1591, wire_46, wire_40, wire_31, wire_25, wire_1515, wire_25, wire_1513, wire_25};
    // CHNAXY TOTAL: 25
    assign wire_1990 = io_tile_1_0_chanxy_out[0];
    assign wire_1992 = io_tile_1_0_chanxy_out[1];
    assign wire_1993 = io_tile_1_0_chanxy_out[2];
    assign wire_1994 = io_tile_1_0_chanxy_out[3];
    assign wire_1996 = io_tile_1_0_chanxy_out[4];
    assign wire_1998 = io_tile_1_0_chanxy_out[5];
    assign wire_2000 = io_tile_1_0_chanxy_out[6];
    assign wire_2001 = io_tile_1_0_chanxy_out[7];
    assign wire_2002 = io_tile_1_0_chanxy_out[8];
    assign wire_2004 = io_tile_1_0_chanxy_out[9];
    assign wire_2006 = io_tile_1_0_chanxy_out[10];
    assign wire_2008 = io_tile_1_0_chanxy_out[11];
    assign wire_2009 = io_tile_1_0_chanxy_out[12];
    assign wire_2010 = io_tile_1_0_chanxy_out[13];
    assign wire_2012 = io_tile_1_0_chanxy_out[14];
    assign wire_2014 = io_tile_1_0_chanxy_out[15];
    assign wire_2016 = io_tile_1_0_chanxy_out[16];
    assign wire_2017 = io_tile_1_0_chanxy_out[17];
    assign wire_2018 = io_tile_1_0_chanxy_out[18];
    assign wire_2020 = io_tile_1_0_chanxy_out[19];
    assign wire_2022 = io_tile_1_0_chanxy_out[20];
    assign wire_2024 = io_tile_1_0_chanxy_out[21];
    assign wire_2025 = io_tile_1_0_chanxy_out[22];
    assign wire_2026 = io_tile_1_0_chanxy_out[23];
    assign wire_2028 = io_tile_1_0_chanxy_out[24];
    assign io_tile_2_0_chanxy_in = {wire_2024, wire_1629, wire_1619, wire_1609, wire_1599, wire_94, wire_85, wire_79, wire_2016, wire_1627, wire_1617, wire_1607, wire_1597, wire_91, wire_85, wire_76, wire_2008, wire_1625, wire_1615, wire_1605, wire_1595, wire_327, wire_91, wire_82, wire_76, wire_2000, wire_1623, wire_1613, wire_1603, wire_1593, wire_327, wire_88, wire_82, wire_73, wire_1992, wire_1621, wire_1611, wire_1601, wire_1591, wire_94, wire_88, wire_79, wire_73, wire_2049, wire_1709, wire_1699, wire_1689, wire_1679, wire_94, wire_85, wire_79, wire_2047, wire_1707, wire_1697, wire_1687, wire_1677, wire_91, wire_85, wire_76, wire_2045, wire_1705, wire_1695, wire_1685, wire_1675, wire_327, wire_91, wire_82, wire_76, wire_2043, wire_1703, wire_1693, wire_1683, wire_1673, wire_327, wire_88, wire_82, wire_73, wire_2041, wire_1701, wire_1691, wire_1681, wire_1671, wire_94, wire_88, wire_79, wire_73};
    // CHNAXY TOTAL: 10
    assign wire_1995 = io_tile_2_0_chanxy_out[0];
    assign wire_2003 = io_tile_2_0_chanxy_out[1];
    assign wire_2011 = io_tile_2_0_chanxy_out[2];
    assign wire_2019 = io_tile_2_0_chanxy_out[3];
    assign wire_2027 = io_tile_2_0_chanxy_out[4];
    assign wire_2030 = io_tile_2_0_chanxy_out[5];
    assign wire_2032 = io_tile_2_0_chanxy_out[6];
    assign wire_2034 = io_tile_2_0_chanxy_out[7];
    assign wire_2036 = io_tile_2_0_chanxy_out[8];
    assign wire_2038 = io_tile_2_0_chanxy_out[9];
    assign io_tile_3_0_chanxy_in = {wire_2026, wire_1709, wire_1699, wire_1689, wire_1679, wire_142, wire_133, wire_127, wire_2018, wire_1707, wire_1697, wire_1687, wire_1677, wire_139, wire_133, wire_124, wire_2010, wire_1705, wire_1695, wire_1685, wire_1675, wire_349, wire_139, wire_130, wire_124, wire_2002, wire_1703, wire_1693, wire_1683, wire_1673, wire_349, wire_136, wire_130, wire_121, wire_1994, wire_1701, wire_1691, wire_1681, wire_1671, wire_142, wire_136, wire_127, wire_121, wire_2059, wire_1789, wire_1779, wire_1769, wire_1759, wire_142, wire_133, wire_127, wire_2057, wire_1787, wire_1777, wire_1767, wire_1757, wire_139, wire_133, wire_124, wire_2055, wire_1785, wire_1775, wire_1765, wire_1755, wire_349, wire_139, wire_130, wire_124, wire_2053, wire_1783, wire_1773, wire_1763, wire_1753, wire_349, wire_136, wire_130, wire_121, wire_2051, wire_1781, wire_1771, wire_1761, wire_1751, wire_142, wire_136, wire_127, wire_121};
    // CHNAXY TOTAL: 10
    assign wire_1997 = io_tile_3_0_chanxy_out[0];
    assign wire_2005 = io_tile_3_0_chanxy_out[1];
    assign wire_2013 = io_tile_3_0_chanxy_out[2];
    assign wire_2021 = io_tile_3_0_chanxy_out[3];
    assign wire_2029 = io_tile_3_0_chanxy_out[4];
    assign wire_2040 = io_tile_3_0_chanxy_out[5];
    assign wire_2042 = io_tile_3_0_chanxy_out[6];
    assign wire_2044 = io_tile_3_0_chanxy_out[7];
    assign wire_2046 = io_tile_3_0_chanxy_out[8];
    assign wire_2048 = io_tile_3_0_chanxy_out[9];
    assign io_tile_4_0_chanxy_in = {wire_2028, wire_1789, wire_1779, wire_1769, wire_1759, wire_190, wire_181, wire_175, wire_2020, wire_1787, wire_1777, wire_1767, wire_1757, wire_187, wire_181, wire_172, wire_2012, wire_1785, wire_1775, wire_1765, wire_1755, wire_371, wire_187, wire_178, wire_172, wire_2004, wire_1783, wire_1773, wire_1763, wire_1753, wire_371, wire_184, wire_178, wire_169, wire_1996, wire_1781, wire_1771, wire_1761, wire_1751, wire_190, wire_184, wire_175, wire_169, wire_2069, wire_1869, wire_1859, wire_1849, wire_1839, wire_190, wire_181, wire_175, wire_2067, wire_1867, wire_1857, wire_1847, wire_1837, wire_187, wire_181, wire_172, wire_2065, wire_1865, wire_1855, wire_1845, wire_1835, wire_371, wire_187, wire_178, wire_172, wire_2063, wire_1863, wire_1853, wire_1843, wire_1833, wire_371, wire_184, wire_178, wire_169, wire_2061, wire_1861, wire_1851, wire_1841, wire_1831, wire_190, wire_184, wire_175, wire_169};
    // CHNAXY TOTAL: 10
    assign wire_1991 = io_tile_4_0_chanxy_out[0];
    assign wire_1999 = io_tile_4_0_chanxy_out[1];
    assign wire_2007 = io_tile_4_0_chanxy_out[2];
    assign wire_2015 = io_tile_4_0_chanxy_out[3];
    assign wire_2023 = io_tile_4_0_chanxy_out[4];
    assign wire_2050 = io_tile_4_0_chanxy_out[5];
    assign wire_2052 = io_tile_4_0_chanxy_out[6];
    assign wire_2054 = io_tile_4_0_chanxy_out[7];
    assign wire_2056 = io_tile_4_0_chanxy_out[8];
    assign wire_2058 = io_tile_4_0_chanxy_out[9];
    assign io_tile_5_0_chanxy_in = {wire_1915, wire_393, wire_2022, wire_1869, wire_1859, wire_1849, wire_1839, wire_238, wire_229, wire_223, wire_1923, wire_235, wire_2014, wire_1867, wire_1857, wire_1847, wire_1837, wire_235, wire_229, wire_220, wire_1931, wire_229, wire_2006, wire_1865, wire_1855, wire_1845, wire_1835, wire_393, wire_235, wire_226, wire_220, wire_1939, wire_223, wire_1998, wire_1863, wire_1853, wire_1843, wire_1833, wire_393, wire_232, wire_226, wire_217, wire_1947, wire_217, wire_1990, wire_1861, wire_1851, wire_1841, wire_1831, wire_238, wire_232, wire_223, wire_217, wire_1949, wire_1917, wire_238, wire_1925, wire_232, wire_1933, wire_226, wire_1941, wire_220, wire_1911, wire_1919, wire_238, wire_1927, wire_232, wire_1935, wire_226, wire_1943, wire_220, wire_1913, wire_393, wire_1921, wire_235, wire_1929, wire_229, wire_1937, wire_223, wire_1945, wire_217};
    // CHNAXY TOTAL: 25
    assign wire_2031 = io_tile_5_0_chanxy_out[0];
    assign wire_2033 = io_tile_5_0_chanxy_out[1];
    assign wire_2035 = io_tile_5_0_chanxy_out[2];
    assign wire_2037 = io_tile_5_0_chanxy_out[3];
    assign wire_2039 = io_tile_5_0_chanxy_out[4];
    assign wire_2041 = io_tile_5_0_chanxy_out[5];
    assign wire_2043 = io_tile_5_0_chanxy_out[6];
    assign wire_2045 = io_tile_5_0_chanxy_out[7];
    assign wire_2047 = io_tile_5_0_chanxy_out[8];
    assign wire_2049 = io_tile_5_0_chanxy_out[9];
    assign wire_2051 = io_tile_5_0_chanxy_out[10];
    assign wire_2053 = io_tile_5_0_chanxy_out[11];
    assign wire_2055 = io_tile_5_0_chanxy_out[12];
    assign wire_2057 = io_tile_5_0_chanxy_out[13];
    assign wire_2059 = io_tile_5_0_chanxy_out[14];
    assign wire_2060 = io_tile_5_0_chanxy_out[15];
    assign wire_2061 = io_tile_5_0_chanxy_out[16];
    assign wire_2062 = io_tile_5_0_chanxy_out[17];
    assign wire_2063 = io_tile_5_0_chanxy_out[18];
    assign wire_2064 = io_tile_5_0_chanxy_out[19];
    assign wire_2065 = io_tile_5_0_chanxy_out[20];
    assign wire_2066 = io_tile_5_0_chanxy_out[21];
    assign wire_2067 = io_tile_5_0_chanxy_out[22];
    assign wire_2068 = io_tile_5_0_chanxy_out[23];
    assign wire_2069 = io_tile_5_0_chanxy_out[24];
    assign io_tile_0_1_chanxy_in = {wire_2027, wire_2025, wire_2109, wire_2099, wire_2089, wire_2079, wire_1559, wire_286, wire_277, wire_271, wire_2023, wire_308, wire_2021, wire_308, wire_2019, wire_286, wire_2017, wire_286, wire_2107, wire_2097, wire_2087, wire_2077, wire_1557, wire_283, wire_277, wire_268, wire_2015, wire_283, wire_2013, wire_283, wire_2011, wire_280, wire_2009, wire_280, wire_2105, wire_2095, wire_2085, wire_2075, wire_1555, wire_308, wire_283, wire_274, wire_268, wire_2007, wire_277, wire_2005, wire_277, wire_2003, wire_274, wire_2001, wire_274, wire_2103, wire_2093, wire_2083, wire_2073, wire_1553, wire_308, wire_280, wire_274, wire_265, wire_1999, wire_271, wire_1997, wire_271, wire_1995, wire_268, wire_1993, wire_268, wire_2101, wire_2091, wire_2081, wire_2071, wire_1551, wire_286, wire_280, wire_271, wire_265, wire_1991, wire_265, wire_2029, wire_265};
    // CHNAXY TOTAL: 25
    assign wire_1510 = io_tile_0_1_chanxy_out[0];
    assign wire_1512 = io_tile_0_1_chanxy_out[1];
    assign wire_1513 = io_tile_0_1_chanxy_out[2];
    assign wire_1514 = io_tile_0_1_chanxy_out[3];
    assign wire_1516 = io_tile_0_1_chanxy_out[4];
    assign wire_1518 = io_tile_0_1_chanxy_out[5];
    assign wire_1520 = io_tile_0_1_chanxy_out[6];
    assign wire_1521 = io_tile_0_1_chanxy_out[7];
    assign wire_1522 = io_tile_0_1_chanxy_out[8];
    assign wire_1524 = io_tile_0_1_chanxy_out[9];
    assign wire_1526 = io_tile_0_1_chanxy_out[10];
    assign wire_1528 = io_tile_0_1_chanxy_out[11];
    assign wire_1529 = io_tile_0_1_chanxy_out[12];
    assign wire_1530 = io_tile_0_1_chanxy_out[13];
    assign wire_1532 = io_tile_0_1_chanxy_out[14];
    assign wire_1534 = io_tile_0_1_chanxy_out[15];
    assign wire_1536 = io_tile_0_1_chanxy_out[16];
    assign wire_1537 = io_tile_0_1_chanxy_out[17];
    assign wire_1538 = io_tile_0_1_chanxy_out[18];
    assign wire_1540 = io_tile_0_1_chanxy_out[19];
    assign wire_1542 = io_tile_0_1_chanxy_out[20];
    assign wire_1544 = io_tile_0_1_chanxy_out[21];
    assign wire_1545 = io_tile_0_1_chanxy_out[22];
    assign wire_1546 = io_tile_0_1_chanxy_out[23];
    assign wire_1548 = io_tile_0_1_chanxy_out[24];
    assign io_tile_0_2_chanxy_in = {wire_2109, wire_2099, wire_2089, wire_2079, wire_1544, wire_492, wire_483, wire_477, wire_2107, wire_2097, wire_2087, wire_2077, wire_1536, wire_489, wire_483, wire_474, wire_2105, wire_2095, wire_2085, wire_2075, wire_1528, wire_514, wire_489, wire_480, wire_474, wire_2103, wire_2093, wire_2083, wire_2073, wire_1520, wire_514, wire_486, wire_480, wire_471, wire_2101, wire_2091, wire_2081, wire_2071, wire_1512, wire_492, wire_486, wire_477, wire_471, wire_2189, wire_2179, wire_2169, wire_2159, wire_1569, wire_492, wire_483, wire_477, wire_2187, wire_2177, wire_2167, wire_2157, wire_1567, wire_489, wire_483, wire_474, wire_2185, wire_2175, wire_2165, wire_2155, wire_1565, wire_514, wire_489, wire_480, wire_474, wire_2183, wire_2173, wire_2163, wire_2153, wire_1563, wire_514, wire_486, wire_480, wire_471, wire_2181, wire_2171, wire_2161, wire_2151, wire_1561, wire_492, wire_486, wire_477, wire_471};
    // CHNAXY TOTAL: 10
    assign wire_1515 = io_tile_0_2_chanxy_out[0];
    assign wire_1523 = io_tile_0_2_chanxy_out[1];
    assign wire_1531 = io_tile_0_2_chanxy_out[2];
    assign wire_1539 = io_tile_0_2_chanxy_out[3];
    assign wire_1547 = io_tile_0_2_chanxy_out[4];
    assign wire_1550 = io_tile_0_2_chanxy_out[5];
    assign wire_1552 = io_tile_0_2_chanxy_out[6];
    assign wire_1554 = io_tile_0_2_chanxy_out[7];
    assign wire_1556 = io_tile_0_2_chanxy_out[8];
    assign wire_1558 = io_tile_0_2_chanxy_out[9];
    assign io_tile_0_3_chanxy_in = {wire_2189, wire_2179, wire_2169, wire_2159, wire_1546, wire_698, wire_689, wire_683, wire_2187, wire_2177, wire_2167, wire_2157, wire_1538, wire_695, wire_689, wire_680, wire_2185, wire_2175, wire_2165, wire_2155, wire_1530, wire_720, wire_695, wire_686, wire_680, wire_2183, wire_2173, wire_2163, wire_2153, wire_1522, wire_720, wire_692, wire_686, wire_677, wire_2181, wire_2171, wire_2161, wire_2151, wire_1514, wire_698, wire_692, wire_683, wire_677, wire_2269, wire_2259, wire_2249, wire_2239, wire_1579, wire_698, wire_689, wire_683, wire_2267, wire_2257, wire_2247, wire_2237, wire_1577, wire_695, wire_689, wire_680, wire_2265, wire_2255, wire_2245, wire_2235, wire_1575, wire_720, wire_695, wire_686, wire_680, wire_2263, wire_2253, wire_2243, wire_2233, wire_1573, wire_720, wire_692, wire_686, wire_677, wire_2261, wire_2251, wire_2241, wire_2231, wire_1571, wire_698, wire_692, wire_683, wire_677};
    // CHNAXY TOTAL: 10
    assign wire_1517 = io_tile_0_3_chanxy_out[0];
    assign wire_1525 = io_tile_0_3_chanxy_out[1];
    assign wire_1533 = io_tile_0_3_chanxy_out[2];
    assign wire_1541 = io_tile_0_3_chanxy_out[3];
    assign wire_1549 = io_tile_0_3_chanxy_out[4];
    assign wire_1560 = io_tile_0_3_chanxy_out[5];
    assign wire_1562 = io_tile_0_3_chanxy_out[6];
    assign wire_1564 = io_tile_0_3_chanxy_out[7];
    assign wire_1566 = io_tile_0_3_chanxy_out[8];
    assign wire_1568 = io_tile_0_3_chanxy_out[9];
    assign io_tile_0_4_chanxy_in = {wire_2269, wire_2259, wire_2249, wire_2239, wire_1548, wire_904, wire_895, wire_889, wire_2267, wire_2257, wire_2247, wire_2237, wire_1540, wire_901, wire_895, wire_886, wire_2265, wire_2255, wire_2245, wire_2235, wire_1532, wire_926, wire_901, wire_892, wire_886, wire_2263, wire_2253, wire_2243, wire_2233, wire_1524, wire_926, wire_898, wire_892, wire_883, wire_2261, wire_2251, wire_2241, wire_2231, wire_1516, wire_904, wire_898, wire_889, wire_883, wire_2349, wire_2339, wire_2329, wire_2319, wire_1589, wire_904, wire_895, wire_889, wire_2347, wire_2337, wire_2327, wire_2317, wire_1587, wire_901, wire_895, wire_886, wire_2345, wire_2335, wire_2325, wire_2315, wire_1585, wire_926, wire_901, wire_892, wire_886, wire_2343, wire_2333, wire_2323, wire_2313, wire_1583, wire_926, wire_898, wire_892, wire_883, wire_2341, wire_2331, wire_2321, wire_2311, wire_1581, wire_904, wire_898, wire_889, wire_883};
    // CHNAXY TOTAL: 10
    assign wire_1511 = io_tile_0_4_chanxy_out[0];
    assign wire_1519 = io_tile_0_4_chanxy_out[1];
    assign wire_1527 = io_tile_0_4_chanxy_out[2];
    assign wire_1535 = io_tile_0_4_chanxy_out[3];
    assign wire_1543 = io_tile_0_4_chanxy_out[4];
    assign wire_1570 = io_tile_0_4_chanxy_out[5];
    assign wire_1572 = io_tile_0_4_chanxy_out[6];
    assign wire_1574 = io_tile_0_4_chanxy_out[7];
    assign wire_1576 = io_tile_0_4_chanxy_out[8];
    assign wire_1578 = io_tile_0_4_chanxy_out[9];
    assign io_tile_0_5_chanxy_in = {wire_2399, wire_1132, wire_2349, wire_2339, wire_2329, wire_2319, wire_1542, wire_1110, wire_1101, wire_1095, wire_2407, wire_1107, wire_2347, wire_2337, wire_2327, wire_2317, wire_1534, wire_1107, wire_1101, wire_1092, wire_2415, wire_1101, wire_2345, wire_2335, wire_2325, wire_2315, wire_1526, wire_1132, wire_1107, wire_1098, wire_1092, wire_2423, wire_1095, wire_2343, wire_2333, wire_2323, wire_2313, wire_1518, wire_1132, wire_1104, wire_1098, wire_1089, wire_2391, wire_1089, wire_2341, wire_2331, wire_2321, wire_2311, wire_1510, wire_1110, wire_1104, wire_1095, wire_1089, wire_2393, wire_2401, wire_1110, wire_2409, wire_1104, wire_2417, wire_1098, wire_2425, wire_1092, wire_2395, wire_2403, wire_1110, wire_2411, wire_1104, wire_2419, wire_1098, wire_2427, wire_1092, wire_2397, wire_1132, wire_2405, wire_1107, wire_2413, wire_1101, wire_2421, wire_1095, wire_2429, wire_1089};
    // CHNAXY TOTAL: 25
    assign wire_1551 = io_tile_0_5_chanxy_out[0];
    assign wire_1553 = io_tile_0_5_chanxy_out[1];
    assign wire_1555 = io_tile_0_5_chanxy_out[2];
    assign wire_1557 = io_tile_0_5_chanxy_out[3];
    assign wire_1559 = io_tile_0_5_chanxy_out[4];
    assign wire_1561 = io_tile_0_5_chanxy_out[5];
    assign wire_1563 = io_tile_0_5_chanxy_out[6];
    assign wire_1565 = io_tile_0_5_chanxy_out[7];
    assign wire_1567 = io_tile_0_5_chanxy_out[8];
    assign wire_1569 = io_tile_0_5_chanxy_out[9];
    assign wire_1571 = io_tile_0_5_chanxy_out[10];
    assign wire_1573 = io_tile_0_5_chanxy_out[11];
    assign wire_1575 = io_tile_0_5_chanxy_out[12];
    assign wire_1577 = io_tile_0_5_chanxy_out[13];
    assign wire_1579 = io_tile_0_5_chanxy_out[14];
    assign wire_1580 = io_tile_0_5_chanxy_out[15];
    assign wire_1581 = io_tile_0_5_chanxy_out[16];
    assign wire_1582 = io_tile_0_5_chanxy_out[17];
    assign wire_1583 = io_tile_0_5_chanxy_out[18];
    assign wire_1584 = io_tile_0_5_chanxy_out[19];
    assign wire_1585 = io_tile_0_5_chanxy_out[20];
    assign wire_1586 = io_tile_0_5_chanxy_out[21];
    assign wire_1587 = io_tile_0_5_chanxy_out[22];
    assign wire_1588 = io_tile_0_5_chanxy_out[23];
    assign wire_1589 = io_tile_0_5_chanxy_out[24];
endmodule
