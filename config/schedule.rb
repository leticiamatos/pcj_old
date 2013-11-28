every 3.minute do
  puts "ENTRANDO!"
  runner "HomeController.recache"
  #runner "Cers::CoursesController.recache"
  runner "Cers::TeachersController.recache"
  runner "Cms::DownloadController.recache"
  runner "Cms::NewsController.recache"
  runner "Bookstore::BooksController.recache"
  runner "CareersController.recache"
  puts "RECACHEANDO!"  
end