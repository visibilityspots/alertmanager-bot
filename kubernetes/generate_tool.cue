package kubernetes

command: generate: task: write: file.Create & {
	filename: "kubernetes/kubernetes.yaml"
	contents: yaml.MarshalStream([ o for o in alertmanagerBot ])
}
