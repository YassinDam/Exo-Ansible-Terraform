provider "kubernetes" {
  config_path = "~/.kube/config"  
}

resource "kubernetes_namespace" "demo-app" {
  metadata {
    name = "demo-app-namespace"  
  }
}

resource "kubernetes_service" "nginx_service" {
  metadata {
    name      = "nginx-service"
    namespace = kubernetes_namespace.demo-app.metadata[0].name
  }

  spec {
    selector = {
      app = "nginx-pod"  
    }

    type = "LoadBalancer"  

    port {
      port        = 80        
      target_port = 80        
    }
  }
}
