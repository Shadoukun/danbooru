module DelayedJobsHelper
  def print_name(job)
    case job.name
    when "TagSubscription.process"
      "<strong>process tag subscription</strong>"

    when "Class#expire_cache"
      "<strong>expire post count cache</strong>"

    when "Upload#process!"
      "<strong>upload post</strong>"

    when "Tag#update_related"
      "<strong>update related tags</strong>"

    when "TagAlias#process!"
      "<strong>alias</strong>"

    when "TagImplication#process!"
      "<strong>implication</strong>"

    when "Class#clear_cache_for"
      "<strong>expire tag alias cache</strong>"

    when "Tag#update_category_cache"
      "<strong>update tag category cache</strong>"

    when "Tag#update_category_post_counts"
      "<strong>update category post counts</strong>"

    when "Class#process"
      "<strong>update tag subscription</strong>"

    when "Class#remove_iqdb"
      "<strong>remove from iqdb</strong>"

    when "Post#update_iqdb"
      "<strong>update iqdb</strong>"

    when "Class#convert"
      "<strong>convert ugoira</strong>"

    when "Class#increment_post_counts"
      "<strong>increment post counts</strong>"

    when "Class#decrement_post_counts"
      "<strong>decrement post counts</strong>"

    when "Pool#update_category_pseudo_tags_for_posts"
      "<strong>update pool category pseudo tags for posts</strong>"

    else
      h(job.name)
    end
  end

  def print_handler(job)
    case job.name
    when "TagSubscription.process"
      ""

    when "Class#expire_cache"
      h(job.payload_object.args.flatten.join(" "))

    when "Upload#process!"
      %{<a href="/uploads/#{job.payload_object.object.id}">record</a>}

    when "Tag#update_related"
      h(job.payload_object.name)

    when "TagAlias#process!"
      h(job.payload_object.antecedent_name) + " -&gt; " + h(job.payload_object.consequent_name)

    when "TagImplication#process!"
      h(job.payload_object.antecedent_name) + " -&gt; " + h(job.payload_object.consequent_name)

    when "Class#clear_cache_for"
      h(job.payload_object.args.flatten.join(" "))

    when "Tag#update_category_cache"
      h(job.payload_object.name)

    when "Tag#update_category_post_counts"
      h(job.payload_object.name)

    when "Class#process", "Class#remove_iqdb"
      h(job.payload_object.args.flatten.join(" "))

    when "Post#update_iqdb"
      h(job.payload_object.id)

    when "Class#convert"
      h(job.payload_object.args[0])

    when "Class#increment_post_counts"
      h(job.payload_object.args.join(" "))

    when "Class#decrement_post_counts"
      h(job.payload_object.args.join(" "))

    when "Pool#update_category_pseudo_tags_for_posts"
      %{<a href="/pools/#{job.payload_object.id}">#{h(job.payload_object.name)}</a>}

    else
      h(job.handler)
    end
  end
end
