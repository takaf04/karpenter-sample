# karpenter on AWS EKS Sample

1. Terraform にパラメータをセット

2. Terraform で構築

   ```
   terrafrom init
   terrafrom plan
   terrafrom apply
   ```

3. karpenter のデバッグログを有効にする

   ```
   kubectl patch configmap config-logging -n karpenter --patch '{"data":{"loglevel.controller":"debug"}}'
   ```

4. Provisioner を作成する

   ```
   kubectl apply -f karpenter.yaml
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
   kubectl apply -f depoloyment.yaml
   ```

7. Deployment をスケールさせる

   ```
   kubectl scale deployment inflate --replicas 5
   ```

8. 環境を削除する

   ```
   kubectl delete -f depoloyment.yaml
   kubectl delete -f karpenter.yaml
   ```

9. EKS を削除する

   ```
   terrafrom destroy
   ```
