# 50を上限とする
User.limit(50).each do |user|
  # userと関連付けさせるからこういう記述にする。tutorialの13章参照
  post = user.posts.create(
    content: Faker::Hacker.say_something_smart,
    remote_images_urls: %w[https://picsum.photos/350/350/?random]
  )
end