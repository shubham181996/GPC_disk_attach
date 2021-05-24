provider "google" {
    project = "refined-legend-314417"
    region = "asia-south1"
    credentials = "terraformkey.json"
}

resource "google_compute_instance" "webos" {
    name = "webos"
    machine_type = "e2-medium"
    zone = "asia-south1-c"


    boot_disk {
        initialize_params {
            image = "debian-cloud/debian-9"
        }
    }

    network_interface {
        network = "default"
    }

}

resource "google_compute_disk" "Storage" {
    name = "test-disk"
    type = "pd-ssd"
    zone = "asia-south1-c"
    size = 5
}

resource "google_compute_attached_disk" "attach_disk" {
    disk = google_compute_disk.Storage.id
    instance = google_compute_instance.webos.id
}
