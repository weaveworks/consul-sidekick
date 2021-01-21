module github.com/weaveworks-experiments/consul-sidekick

go 1.15

require (
	github.com/hashicorp/consul/api v1.8.1
	k8s.io/apimachinery v0.20.2
	k8s.io/client-go v11.0.0+incompatible
)

replace (
	k8s.io/client-go => k8s.io/client-go v0.20.2
)
