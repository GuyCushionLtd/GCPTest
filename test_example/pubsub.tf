module "pubsub1" {
  source       = "../modules/pubsub"
  project_id   = var.project_id
  topic        = "${var.topic_name}-1"
  topic_labels = var.topic_labels 

  pull_subscriptions = [
    {
      name                 = "pull"
      ack_deadline_seconds = 10
    },
  ]

  push_subscriptions = [
    {
      name                 = "push"
      push_endpoint        = "https://${var.project_id}.appspot.com/"
      x-goog-version       = "v1beta1"
      ack_deadline_seconds = 20
    },
  ]

}


module "pubsub2" {
  source       = "../modules/pubsub"
  project_id   = var.project_id
  topic        = "${var.topic_name}-2"
  topic_labels = var.topic_labels 

  pull_subscriptions = [
    {
      name                 = "pull2"
      ack_deadline_seconds = 10
    },
  ]

  push_subscriptions = [
    {
      name                 = "push2"
      push_endpoint        = "https://${var.project_id}.appspot.com/"
      x-goog-version       = "v1beta1"
      ack_deadline_seconds = 20
    },
  ]

}