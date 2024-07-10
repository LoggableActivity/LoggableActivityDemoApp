# frozen_string_literal: true

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Rails.logger.debug '-------------------- Seeding data ---------------------'

LoggableActivity::EncryptionKey.destroy_all

Demo::City.destroy_all
Demo::Address.destroy_all

cities = [
  { name: 'Jukkasjärvi', country: 'Sweden', demo_addresses_attributes: [{ street: 'Ice Hotel, Marknadsvägen 63', postal_code: '981 91' }] },
  { name: 'Versailles', country: 'France', demo_addresses_attributes: [{ street: 'The Palace of Versailles', postal_code: '78000' }] },
  { name: 'Santorini', country: 'Greece', demo_addresses_attributes: [{ street: 'Santorini, Thera 847 00', postal_code: '847 00' }] },
  { name: 'Ma\'an', country: 'Jordan', demo_addresses_attributes: [{ street: 'Petra, Wadi Musa', postal_code: '71810' }] },
  { name: 'Giza', country: 'Egypt', demo_addresses_attributes: [{ street: 'Pyramid of Giza', postal_code: '12588' }] },
  { name: 'Beijing', country: 'China', demo_addresses_attributes: [{ street: 'The Great Wall of China', postal_code: '100006' }] },
  { name: 'Paris', country: 'France', demo_addresses_attributes: [{ street: 'Eiffel Tower', postal_code: '75007' }] },
  { name: 'Aguas Calientes', country: 'Peru', demo_addresses_attributes: [{ street: 'Machu Picchu', postal_code: '08680' }] }
]

cities.each do |city_attr|
  Demo::City.create!(city_attr)
end

clubs = [
  { name: 'Electric Oasis Club', demo_address_id: Demo::Address.first.id },
  { name: 'Sapphire Moon Lounge', demo_address_id: Demo::Address.second.id },
  { name: 'Starlight Jazz Café', demo_address_id: Demo::Address.third.id },
  { name: 'Mystic Fusion Lounge', demo_address_id: Demo::Address.fourth.id },
  { name: 'Galactic Groove Hub', demo_address_id: Demo::Address.fifth.id },
  { name: 'Neon Jungle Club', demo_address_id: Demo::Address.first(6).last.id },
  { name: 'Cosmic Beats Bar', demo_address_id: Demo::Address.first(7).last.id },
  { name: 'Enchanted Harbor Lounge', demo_address_id: Demo::Address.first(8).last.id },
  { name: 'Retro Rocket Club', demo_address_id: Demo::Address.first.id },
  { name: 'Emerald Dream Lounge', demo_address_id: Demo::Address.second.id },
  { name: 'Time Warp Disco', demo_address_id: Demo::Address.third.id },
  { name: 'Aurora Borealis Bar', demo_address_id: Demo::Address.fourth.id },
  { name: 'Underground Labyrinth Club', demo_address_id: Demo::Address.fifth.id },
  { name: 'Crystal Cavern Lounge', demo_address_id: Demo::Address.first(8).last.id },
  { name: 'Phantom Masquerade Ball', demo_address_id: Demo::Address.first(7).last.id },
  { name: 'Elysian Gardens Club', demo_address_id: Demo::Address.first(6).last.id },
  { name: 'Jungle Fever Disco', demo_address_id: Demo::Address.first.id },
  { name: 'Lost Galaxy Lounge', demo_address_id: Demo::Address.second.id },
  { name: 'Secret Haven Club', demo_address_id: Demo::Address.third.id },
  { name: 'Nebula Nightfall Bar', demo_address_id: Demo::Address.fourth.id }
]

Demo::Club.destroy_all
clubs.each do |club|
  Demo::Club.find_or_create_by!(club)
end

users = [
  {
    email: 'kurt@example.com',
    password: 'password1234',
    password_confirmation: 'password1234',
    first_name: 'Kurt',
    last_name: 'Cobain',
    age: 27,
    bio: 'Lead singer of Nirvana',
    demo_address_id: Demo::Address.first.id,
    demo_club_id: Demo::Club.first.id,
    user_type: 'Patient',
    demo_user_profile_attributes: {
      sex: 'Male',
      religion: 'Atheist'
    }
  },
  {
    email: 'jimi@example.com',
    password: 'password1234',
    password_confirmation: 'password1234',
    first_name: 'Jimi',
    last_name: 'Hendrix',
    age: 27,
    bio: 'Legendary guitarist',
    demo_address_id: Demo::Address.second.id,
    demo_club_id: Demo::Club.first.id,
    user_type: 'Patient',
    demo_user_profile_attributes: {
      sex: 'Male',
      religion: 'Buddhist'
    }
  },
  {
    email: 'janis@example.com',
    password: 'password1234',
    password_confirmation: 'password1234',
    first_name: 'Janis',
    last_name: 'Joplin',
    age: 27,
    bio: 'Rock and blues singer',
    demo_address_id: Demo::Address.third.id,
    demo_club_id: Demo::Club.first.id,
    user_type: 'Patient',
    demo_user_profile_attributes: {
      sex: 'Female',
      religion: 'Christianity'
    }
  },
  {
    email: 'jim@example.com',
    password: 'password1234',
    password_confirmation: 'password1234',
    first_name: 'Jim',
    last_name: 'Morrison',
    age: 27,
    bio: 'Lead singer of The Doors',
    demo_address_id: Demo::Address.fourth.id,
    demo_club_id: Demo::Club.second.id,
    user_type: 'Doctor',
    demo_user_profile_attributes: {
      sex: 'Male',
      religion: 'Atheist'
    }
  },
  {
    email: 'elvis@example.com',
    password: 'password1234',
    password_confirmation: 'password1234',
    first_name: 'Elvis',
    last_name: 'Presley',
    age: 42,
    bio: 'King of Rock and Roll',
    demo_address_id: Demo::Address.fifth.id,
    demo_club_id: Demo::Club.third.id,
    user_type: 'Patient',
    demo_user_profile_attributes: {
      sex: 'Male',
      religion: 'Christianity'
    }
  },
  {
    email: 'freddie@example.com',
    password: 'password1234',
    password_confirmation: 'password1234',
    first_name: 'Freddie',
    last_name: 'Mercury',
    age: 45,
    bio: 'Lead singer of Queen',
    demo_address_id: Demo::Address.first(6).last.id,
    demo_club_id: Demo::Club.fourth.id,
    user_type: 'Doctor',
    demo_user_profile_attributes: {
      sex: 'Male',
      religion: 'Zoroastrianism'
    }
  },
  {
    email: 'david@example.com',
    password: 'password1234',
    password_confirmation: 'password1234',
    first_name: 'David',
    last_name: 'Bowie',
    age: 69,
    bio: 'Legendary musician and actor',
    demo_address_id: Demo::Address.first(7).last.id,
    demo_club_id: Demo::Club.fourth.id,
    user_type: 'Patient',
    demo_user_profile_attributes: {
      sex: 'Male',
      religion: 'Agnostic'
    }
  },
  {
    email: 'prince@example.com',
    password: 'password1234',
    password_confirmation: 'password1234',
    first_name: 'Prince',
    last_name: 'Rogers Nelson',
    age: 57,
    bio: 'Iconic musician and artist',
    demo_address_id: Demo::Address.first(8).last.id,
    demo_club_id: Demo::Club.fourth.id,
    user_type: 'Patient',
    demo_user_profile_attributes: {
      sex: 'Male',
      religion: 'Jehovah\'s Witness'
    }
  },
  {
    email: 'max@example.com',
    password: 'password1234',
    password_confirmation: 'password1234',
    first_name: 'Max',
    last_name: 'Greenfield',
    age: 57,
    bio: 'Tech entrepreneur',
    demo_address_id: Demo::Address.first.id,
    demo_club_id: Demo::Club.fourth.id,
    user_type: 'Admin',
    demo_user_profile_attributes: {
      sex: 'Male',
      religion: 'Christianity'
    }
  }
]

User.destroy_all
users.each do |user|
  next if User.find_by(email: user[:email]).present?

  User.create!(user)
end

journals = [
  {
    patient: User.find_by(email: 'prince@example.com'),
    doctor: User.find_by(email: 'freddie@example.com'),
    title: 'Confidential Musings',
    body: 'I have some confidential musings to share about my life. Please keep them between us.',
    state: 'pending'
  },
  {
    patient: User.find_by(email: 'david@example.com'),
    doctor: User.find_by(email: 'jim@example.com'),
    title: 'Secrets of a Foodie',
    body: 'As a foodie, I have some food-related secrets that I need to confess. Let\'s keep it confidential!',
    state: 'pending'
  },
  {
    patient: User.find_by(email: 'janis@example.com'),
    doctor: User.find_by(email: 'jim@example.com'),
    title: 'Gatekeeper No More',
    body: 'I\'ve had my fair share of gatekeeping incidents, but I want to put that behind me. Please keep this private.',
    state: 'pending'
  },
  {
    patient: User.find_by(email: 'elvis@example.com'),
    doctor: User.find_by(email: 'jim@example.com'),
    title: 'Elvis\'s Confession',
    body: 'I\'ve been keeping a secret Elvis impersonation hobby for years. Let\'s keep this between us, doc!',
    state: 'pending'
  },
  {
    patient: User.find_by(email: 'prince@example.com'),
    doctor: User.find_by(email: 'jim@example.com'),
    title: 'Marilyn\'s Private Thoughts',
    body: 'As Marilyn Monroe, I have some private thoughts to share. Please respect my privacy.',
    state: 'pending'
  },
  {
    patient: User.find_by(email: 'kurt@example.com'),
    doctor: User.find_by(email: 'freddie@example.com'),
    title: 'James\'s Hidden Talent',
    body: 'I have a hidden talent that I don\'t want the world to know about. Let\'s keep it confidential.',
    state: 'pending'
  },
  {
    patient: User.find_by(email: 'elvis@example.com'),
    doctor: User.find_by(email: 'freddie@example.com'),
    title: 'Lucille\'s Secret Recipe',
    body: 'I have a secret family recipe that I want to share, but only with you. Keep it safe, doctor!',
    state: 'pending'
  }
]

Demo::Journal.destroy_all
journals.each do |journal|
  Demo::Journal.create!(journal)
end

Rails.logger.debug '------------------ Seeding data done -------------------'
