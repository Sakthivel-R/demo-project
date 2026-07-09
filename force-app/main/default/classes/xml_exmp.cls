public class xml_exmp {
    Public string xmlString {set;get;}
    Public string result	{set;get;}
    public void convert(){
        Dom.document doc=new Dom.document();
        doc.load(xmlString);
        dom.xmlNode root=doc.getRootElement();
        result=result+root.getname();
        list<Dom.xmlNode> child=root.getChildElements();
        if(child.size()>0){
            for(Dom.XmlNode c : child){
                result=result+'\n'+c.getName()+':'+c.getText();
            }
        }
        
    }
}