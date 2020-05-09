puts 'Start inserting seed "posts" ...'
# 100を上限とする
User.limit(100).each do |user|
  # userと関連付けさせるからこういう記述にする。tutorialの13章参照
  post = user.posts.create(
    content: Faker::Hacker.say_something_smart,
    remote_images_urls: %w[https://picsum.photos/350/350/?random https://picsum.photos/350/350/?random]
  )
  puts "post#{post.id} has created!"
end