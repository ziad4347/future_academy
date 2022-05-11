class MenuItem{
 final String image;
 final String name;
 const MenuItem(this.name,this.image);
}
class MenuItems{
  static const home = MenuItem('الصفحة الرئيسية', 'Assets/SVG/home-2.svg');
  static const department = MenuItem('التخصصات', 'Assets/Images/category.svg');
  static const courses = MenuItem('كورسات اون لاين', 'Assets/SVG/book-saved.svg');
  static const news = MenuItem('الاخبار والاحداث', 'Assets/SVG/news.svg');
  static const schdule = MenuItem('جدول المحاضرات', 'Assets/SVG/tables.svg');
  static const request = MenuItem('طلب الالتحاق', 'Assets/SVG/edit.svg');
  static const parteners = MenuItem('شركاء النجاح', 'Assets/SVG/partner.svg');
  static const contact = MenuItem('اتصل بنا', 'Assets/SVG/portrait.svg');
  static const settings = MenuItem('اعداد الاكاديمية', 'Assets/SVG/hastag.svg');
  static const about = MenuItem('عن المستقبل اكاديمى', 'Assets/SVG/info.svg');
  static const profile = MenuItem('البروفايل', 'Assets/SVG/user.svg');

  static const allmenu=<MenuItem>[
    home,department,courses,news,schdule,request,parteners,contact,settings,about,profile,
  ];
}