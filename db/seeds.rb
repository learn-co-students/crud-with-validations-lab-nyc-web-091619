Song.destroy_all

Song.create([
  {
    title: "Liam's Song",
    released: true,
    release_year: 2019,
    artist_name: "Liam H",
    genre: "Rock"
  },
  {
    title: "Rap Song",
    released: false,
    # release_year: 2019,
    artist_name: "Gary H",
    genre: "Rap"
  },
  {
    title: "Owen's Song",
    released: true,
    release_year: 2005,
    artist_name: "Owen H",
    genre: "Hip Hop"
  },
  {
    title: "Liam's Second Song",
    released: false,
    release_year: 2020,
    artist_name: "Liam H",
    genre: "Rock"
  }
])
