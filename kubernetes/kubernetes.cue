package kubernetes

import (
	appsv1 "k8s.io/api/apps/v1"
)

alertmanagerBot : deployment: appsv1.Deployment & {
	apiVersion: "apps/v1"
	kind:       "Deployment"

	spec: template: spec: {
        
    }
}
