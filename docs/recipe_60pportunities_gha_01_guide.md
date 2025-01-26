## Domain 1: Author and maintain workflows  (40% of exam)

### Work with events that trigger workflows
- [x] Configure workflows to run for one or more events
- [x] Configure workflows to run for scheduled events
- [x] Configure workflows to run for manual events
- [x] Configure workflows to run for webhook events (i.e. check_run, check_suite, deployment, etc.)
- [x] Demonstrate a GitHub event to trigger a workflow based on a practical use case
### Use the components of a workflow
- [x] Identify the correct syntax for workflow jobs (i.e. indentation and encapsulation of parts of the workflow)
- [x] Use job steps for actions and shell commands
- [x] Use conditional keywords for steps
- [x] Describe how actions, workflows, jobs, steps, runs, and the marketplace work together
- [x] Identify scenarios suited for using GitHub-hosted and self-hosted runners
- [x] Implement workflow commands as a run step to communicate with the runner
- [x] Demonstrate the use of dependent jobs
### Use encrypted secrets and environment variables as part of a workflow
- [x] Use encrypted secrets to store sensitive information
- [x] Identify the available default environment variables during the construction of the workflow
- [x] Identify the location to set custom environment variables in a workflow
- [x] Identify when to use the GITHUB_TOKEN secret
- [x] Demonstrate how to use workflow commands to set environment variables
### Create a workflow for a particular purpose
- [x] Add a script to a workflow
- [x] Demonstrate how to publish to GitHub Packages using a workflow
- [x] Demonstrate how to publish to GitHub Container Registry using a workflow
- [x] Use database and service containers in a GitHub Actions workflow
- [x] Use labels to route workflows to specific runners
- [x] Use CodeQL as a step in a workflow
- [x] Demonstrate how to publish a component as a GitHub release using GitHub Actions
- [x] Deploy a release to a cloud provider using a GitHub Actions workflow
### Manage workflow runs
- [x] Configure caching of workflow dependencies
- [x] Identify steps to pass data between jobs in a workflow
- [x] Remove workflow artifacts from GitHub
- [x] Add a workflow status badge
- [x] Add environment protections
- [x] Define a matrix of different job configurations
- [x] Implement workflow approval gates

## Domain 2: Consume workflows (20% of exam)
### Interpret the effects of a workflow
- [x] Identify the event that triggered a workflow from its effects in a repository, issue, or pull request
- [x] Describe a workflow’s effects from reading its configuration file
- [x] Diagnose a failed workflow run (i.e. using a workflow run history and its logs, determine why a workflow run may have failed)
- [x] Identify ways to access the workflow logs from the user interface
- [x] Identify ways to access the workflow logs from GitHub’s REST API
- [x] Enable step debug logging in a workflow
- [x] Demonstrate how to use default environment variables in a workflow
- [x] Demonstrate the correct syntax for passing custom environment variables in a workflow step
### Locate a workflow, its logs, and artifacts
- [x] Describe where to locate a workflow in a repository
- [x] Explain the difference between disabling and deleting of workflows
- [x] Demonstrate how to download workflow artifacts from the user interface
- [x] Describe how to use an organization’s templated workflow
### Use actions in a workflow
- [x] Define the indicators of what makes a trustworthy action
- [x] Identify an action’s type, inputs, and outputs
- [x] Demonstrate how to use the specific version of an action in a workflow
## Domain 3: Author and maintain actions (25% of exam)
### Use available action types
- [x] Identify the type of action required for a given problem (i.e. JavaScript, Docker container, run step)
- [x] Demonstrate how to troubleshoot JavaScript actions
- [x] Demonstrate how to troubleshoot Docker container actions
### Describe the components of an action
- [x] Identify the files and directory structure needed to create an action
- [x] Identify the metadata and syntax needed to create an action
- [x] Implement workflow commands within an action to communicate with the runner (Note: this includes exit codes)
### Distribute an action
- [x] Identify how to select an appropriate distribution model for an action (i.e., public, private, marketplace) - [x] Identify the best practices for distributing custom actions
- [x] Demonstrate how to create a release strategy for an action (i.e. versioning)
- [x] Demonstrate how to publish an action to the GitHub marketplace
## Domain 4: Manage GitHub Actions in the enterprise (15% of exam)
### Distribute actions and workflows to the enterprise
- [x] Explain reuse templates for actions and workflows
- [x] Define an approach for managing and leveraging reusable components (i.e. repos for storage, naming conventions for files/folders, and plans for ongoing maintenance)
- [x] Define how to distribute actions for an enterprise
- [x] Define how to control access to actions within the enterprise
- [x] Configure organizational use policies for GitHub Actions
### Manage runners for the enterprise
- [x] Describe the effects of configuring IP allow lists on GitHub-hosted and self-hosted runners
- [x] Describe how to select appropriate runners to support workloads (i.e. using a self-hosted versus GitHub-hosted runner, choosing supported operating systems)
- [x] Explain the difference between GitHub-hosted and self-hosted runners
- [x] Configure self-hosted runners for enterprise use (i.e. including proxies, labels, networking)
- [x] Demonstrate how to manage self-hosted runners using groups (i.e. managing access, moving runners into and between groups)
- [x] Demonstrate how to monitor, troubleshoot, and update self-hosted runners
### Manage encrypted secrets in the enterprise
- [x] Identify the scope of encrypted secrets
- [x] Demonstrate how to access encrypted secrets within actions and workflows
- [x] Explain how to manage organization-level encrypted secrets
- [x] Explain how to manage repository-level encrypted secrets
