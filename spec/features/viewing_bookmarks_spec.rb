feature 'Viewing bookmarks' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content "Bookmark Manager"
  end
end

feature 'Viewing bookmarks' do
  scenario 'Visiting /bookmarks shows all the bookmarks' do
    Bookmark.create(url: "http://www.makersacademy.com", title: 'Makers Academy')
    Bookmark.create(url: "http://www.destroyallsoftware.com", title: 'Destroy Software')
    Bookmark.create(url: "http://www.google.com", title: 'Google')
    Bookmark.create(url: "http://www.elcomercio.es", title: 'El Comercio')
    visit('/bookmarks')

    expect(page).to have_link('Makers Academy', href: "http://www.makersacademy.com")
    expect(page).to have_link('Destroy Software', href: "http://www.destroyallsoftware.com")
    expect(page).to have_link('El Comercio', href: "http://www.elcomercio.es")
    expect(page).to have_link('Google', href: "http://www.google.com")
  end
end
