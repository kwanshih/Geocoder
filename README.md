# Geocoder
 使用CLGeocoder 处理 CLlocation 得到位置信息。
 
 注意：只能处理当前的区域或国家的位置，不同的国家或区域使用不同的地图服务商，而地图服务商只能处理当前区域的位置。在使用 CLGeocoder 处理国外的地址的时 候，需要把地图供应商也切换。否则会出现kCLErrorDomain Code=8错误。

 选择位置  
 Scheme -> Edit Scheme -> Options -> Core Location: Default Location 选择地理位置或者使用自定义的GPX文件。
