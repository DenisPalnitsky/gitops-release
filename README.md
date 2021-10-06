# gitops-release

Github action that updates a single key in other github repository





## Example:
You have a release.yaml file in a `myorg/infra-as-code-repo` repository that has below content:

``` yaml
env:
  - dev:
    myServiceImageTag: "initial-ver"
```

Add this to github acion:

```
      - name: update gitops
        uses: denispalnitsky/gitops-release@v7
        with:
          file: "release.yaml"
          key: "myServiceImageTag"
          value: '${{ github.ref }}
          github-token: ${{ secrets.GIT_ACCESS_TOKEN }}
          github-org-and-repo:  "myorg/infra-as-code-repo"
```
to update content of "myServiceImageTag" with git-ref value
Optionally, you can provide github username and email that will be used to commit the changes
```
      - name: update gitops
        uses: denispalnitsky/gitops-release@v7
        with:
          file: "release.yaml"
          key: "myServiceImageTag"
          value: '${{ github.ref }}
          github-token: ${{ secrets.GIT_ACCESS_TOKEN }}
          github-org-and-repo:  "myorg/infra-as-code-repo"
          github-user-mail: gitops-user
          github-user-mail: bot@example.com

```