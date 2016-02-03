Landmark
  belongs_to :figure
  has_many :landmarks
Title
  has_many :figureTitles
  has_many :titles through: :figuretitles
  

Figure
  has_many :landmarks  #might be missing in readme
  has_many :figureTitles
  has_many :titles through: :figuretitles

Figure_titles
  belongs_to :figure
  belongs_to :title

TODO





Your form for a new figure should dynamically generate checkboxes out of the available landmarks and titles. 

It should also have fields for creating a new landmark and/or a new title. 
The controller action that catches the POST request sent by submitting this form should account for this. The same is true of you form for editing a given figure.


  <p><input type="text" name="figure[title_ids][]"></p>
  <p><input type="text" name="figure[landmark_ids][]"></p>

"title_#{Title.first.id}" checkbox
check "landmark_#{Landmark.first.id}" checkbox

params = {
  genres => [ genre1, genre2, genre2]
}
 
<% Genre.all.each do |genre| %>
  <input id="<%= genre.name %>" type="checkbox" name="genres[]" value="<%= genre.id %>">
<% end %>