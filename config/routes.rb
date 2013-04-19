ActionController::Routing::Routes.draw do |site|
  site.resources :users
  site.resources :votes
  site.resources :avatars
  site.resources :photos, :has_many => :comments
  site.resources :videos, :has_many => :comments

  site.site_root('/',{
       :controller => 'site_root',
       :action => 'index',
       :conditions => {:method=>:get}})
  site.login('/login', {
       :controller => 'user_sessions', 
       :action => 'new',
       :conditions => {:method=>:get}})
  site.logout('/logout', {
       :controller => 'user_sessions', 
       :action => 'destroy',
       :conditions => {:method=>:get}})
  site.signup('/signup', {
       :controller => 'users', 
       :action => 'new',
       :conditions => {:method=>:get}})
  site.video('/video/:id', {
       :controller => 'videos', 
       :action => 'show',
       :conditions => {:method=>:get}})
  site.edit_user('/edit_user', {
       :controller => 'users', 
       :action => 'edit',
       :conditions => {:method=>:get}})
  site.update_user('/update_user', {
       :controller => 'users', 
       :action => 'update',
       :conditions => {:method=>:put}})
  site.show_user('/users/:id', {
       :controller => 'users', 
       :action => 'show',
       :conditions => {:method=>:get}})
  site.make_new_user('/newuser', {
       :controller => 'users', 
       :action => 'create',
       :conditions => {:method=>:post}})
  site.upload_video('/upload_video', {
       :controller => 'videos',
       :action => 'new',
       :conditions => {:method=>:get}})
  site.post_a_video('/post_video', {
       :controller => 'videos',
       :action => 'create', 
       :conditions=>{:method=>:post}})
  site.photo('/photo/:id', {
       :controller => 'photos', 
       :action => 'show',
       :conditions => {:method=>:get}})
  site.upload_photo('/upload_photo', {
       :controller => 'photos',
       :action => 'new',
       :conditions => {:method=>:get}})
  site.post_a_photo('/post_photo', {
       :controller => 'photos',
       :action => 'create', 
       :conditions=>{:method=>:post}})    
  site.lesson_plans('/plans', {
       :controller => 'plans',
       :action => 'create', 
       :conditions=>{:method=>:post}})
  site.user_list('/user_list', {
       :controller => 'users',
       :action => 'index',
       :conditions => {:method=>:get}})
  site.make_comment('/make_comment', {
       :controller => 'comments',
       :action => 'create',
       :conditions => {:method=>:post}})
  
end

