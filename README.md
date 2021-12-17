# karpenter on AWS EKS Sample

1. Terraform にパラメータをセット

2. Terraform で構築

   ```
   terraform init
   terraform plan
   terraform apply
   ```

3. karpenter のデバッグログを有効にする

   ```
   kubectl patch configmap config-logging -n karpenter --patch '{"data":{"loglevel.controller":"debug"}}'
   ```

4. Provisioner を作成する

   ```
   kubectl apply -f provisioner/default_1_getting_started.yaml
   ```

   ```
   kubectl apply -f provisioner/default_2_sample.yaml
   ```

   ```
   kubectl describe provisioner default
   ```

5. karpenter のログを確認する

   ```
   kubectl logs -f -n karpenter $(kubectl get pods -n karpenter -l karpenter=controller -o name)
   ```

6. Deployment を作成する

   ```
   kubectl apply -f depoloyment/sample.yaml
   ```

7. Deployment をスケールさせる

   ```
   kubectl scale deployment inflate --replicas 5
   ```

8. 環境を削除する

   1. Depoloyment

      ```
      kubectl delete -f depoloyment/sample.yaml
      ```

   2. Provisioner

      ```
      kubectl delete -f provisioner/default_1_getting_started.yaml
      ```

      ```
      kubectl delete -f provisioner/default_2_sample.yaml
      ```

9. EKS を削除する

   ```
   terraform destroy
   ```
