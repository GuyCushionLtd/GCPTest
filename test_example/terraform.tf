provider "google" {
  credentials      = "${file("CREDENTIALS_FILE.json")}"
  project          = "Test Project 20377"
  region           = "europe-west2"
 
}
