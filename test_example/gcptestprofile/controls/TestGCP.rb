title 'sample gcp test section'

PROJECT_NUMBER = attribute('project_number', description: 'gcp project number')

control 'gcp-1' do
  impact 0.7
  title 'Check development project'
  describe google_project(project: PROJECT_NUMBER) do
    it { should exist }
    its('name') { should eq 'Test Project 20377' }
    its('project_number') { should cmp PROJECT_NUMBER }
    its('lifecycle_state') { should eq 'ACTIVE' }
  end
end



control 'gcp-2' do
  impact 0.3
  title 'Check Pub Sub exists'

  describe google_pubsub_topic(project: PROJECT_NUMBER, name: 'test_topic-1') do
    it { should exist }
  end

  describe google_pubsub_subscription(project: PROJECT_NUMBER, name: 'pull') do
    it { should exist }
  end

  describe google_pubsub_subscription(project: PROJECT_NUMBER, name: 'push') do
    it { should exist }
  end


  describe google_pubsub_topic(project: PROJECT_NUMBER, name: 'test_topic-2') do
    it { should exist }
  end

  describe google_pubsub_subscription(project: PROJECT_NUMBER, name: 'pull2') do
    it { should exist }
  end

  describe google_pubsub_subscription(project: PROJECT_NUMBER, name: 'push2') do
    it { should exist }
  end

  describe google_pubsub_subscriptions(project: PROJECT_NUMBER) do
    its('count') { should be == 4 }
  end
end

