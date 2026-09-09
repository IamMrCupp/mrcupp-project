---
title: Resume / CV
subtitle: Professional Background
comments: false
---

# Aaron Cupp
Sacramento, CA · Remote

- [GitHub](https://github.com/iammrcupp)
- [LinkedIn](https://linkedin.com/in/mrcupp)
- [Email me](mailto:mrcupp@mrcupp.com)

**Senior / Staff Infrastructure · SRE · Platform Engineer.** Open to senior IC and
engineering-leadership roles — infrastructure, SRE, platform. Remote-first.

## Summary
Infrastructure and site reliability engineer with over two decades building and operating
cloud and on-premises platforms across GCP, AWS, and Azure. Deep hands-on work in
Kubernetes, GitOps, and Infrastructure as Code (Terraform / OpenTofu), plus infrastructure
control evidence for SOX, SOC 2, and PCI-DSS under Big Four external audit. Has built and
run a multi-cloud SRE function to 99.98% uptime with 365-day coverage — and stayed on the
keyboard through it. Builds the platform plumbing other teams ship on, and has a habit of
finding the failure nobody was looking for before it reaches production. Stays sharp
through active open-source work in Rust, Go, and Kubernetes tooling — shipping tested,
CI-backed projects end to end.

## Experience
**[Senior Infrastructure Engineer, Commerce (Feedonomics) — Remote, Jan 2025 – Present](https://feedonomics.com)**

Sole infrastructure IC for FDX Infrastructure — the platform behind Commerce's product-data
feed and marketplace optimization engine. Scope spans platform reliability, infrastructure
as code, audit and compliance evidence, and internal tooling.
* Built the GCP Terraform foundation greenfield — the infrastructure-as-code layout and
  cloud configuration other teams now build on, including an in-progress colo-to-cloud
  migration. Among the top contributors by commit volume.
* Own infrastructure control evidence for SOX, SOC 2, and PCI-DSS under Big Four external
  audit — evidence packages, control-gap remediation, and forensic timeline reconstruction
  from recovered system state.
* Caught an exhausted production disk quota that would have failed six pending deployments;
  reworked the affected changes same-day and built tooling so the condition surfaces
  instead of failing silently.
* Operate Kubernetes with Flux GitOps and a unified observability stack — Grafana,
  Prometheus, Mimir, Loki, Alloy, AlertManager — consolidating metrics and logs from many
  clusters into a single pane of glass.
* Author Terraform / OpenTofu modules and Atlantis automation, keeping environments
  reproducible and reviewable in pull requests.
* Wrote two operational procedures now used by the team: in-place rescue-mode instance
  repair and GCE emergency-mode fstab recovery.
* Lead incident response and the on-call rotation; mentor engineers on Linux fundamentals,
  GitOps practice, and production standards.

**[Founder & Principal Engineer, Tech-Noid Systems — Sacramento, CA, 2008 – Present](https://tech-noid.net)**
*(full-time Aug 2023 – Jan 2025)*

Self-directed technical venture founded in 2008 as a self-built online radio platform, run
full-time between engineering roles and ongoing today. Now a bass music collective with its
own soundsystem, self-hosted infrastructure, open-source tooling, and live performance
technology.
* Designed and operate a self-hosted, multi-node Kubernetes cluster (mixed x86_64 / arm64)
  with Flux GitOps, MetalLB, cert-manager, Helm, and full observability.
* Authored [obs-radio-output](/page/obs-radio-output/) — a native OBS Studio plugin in
  C/C++ against libobs that streams audio directly to Icecast / SHOUTcast, with macOS
  universal, Linux, and Windows builds and a signed, notarized macOS package.
* Manage infrastructure as code with Terraform / OpenTofu, Terragrunt, and Ansible,
  including Discord-as-Code modules; rebuilt the web platform on Hugo.
* Built out a QSC-based soundsystem and run live bass-music events on it; the collective's
  streams, radio feed, and shows all run on infrastructure I operate.

**[Manager, Site Reliability Engineering, Sight Machine — San Francisco, CA (Remote), Nov 2021 – Aug 2023](https://sightmachine.com)**
* Built and led the SRE function — grew the team to three full-time engineers plus two
  offshore teams for 365-day coverage, hiring, onboarding, and developing engineers into
  an on-call-capable organization.
* Engineered multi-cloud, Kubernetes-based infrastructure for a big-data SaaS platform
  across GCP, Azure, and AWS using Python, Kafka, and Terraform, sustaining uptime above
  99.98%.
* Drove a 10% reduction in monthly server spend through autoscaling and spot-instance
  systems; earned the Golden Gear award for cost measures saving $5k monthly.
* Led the Infrastructure Modernization Project, upgrading to modern Kubernetes
  configurations and increasing security and automation across the stack.
* Standardized onboarding, on-call rotations, incident response, and change management.
  Member of the Company Security Response Team and the Engineering Technology Leads Team.

**[Senior Site Reliability Engineer, Sight Machine — Remote, Aug 2021 – Nov 2021](https://sightmachine.com)**
* Elevated to Lead Senior SRE within two months. Pioneered Terraform with Atlantis/GitHub
  CI/CD and established a GitOps framework for all cloud infrastructure.

**[Founder, Emotional Support Pizza — Sacramento, CA, 2019 – 2021](/page/emotional-support-pizza/)**

Woodfired ancient-grain sourdough concept built during a break from tech. Built the full
digital presence — website, brand, and online-ordering flow — which reignited hands-on
engineering and led directly back into infrastructure work.

**[DevOps Engineer, JUUL Labs — San Francisco, CA (Remote), Jul 2017 – May 2019](https://juul.com)**
* Delivered 24/7 on-call support for all e-commerce systems; primary support for Windows
  systems running the Acumatica ERP.
* Implemented log-shipping-based clustering for SQL Server Enterprise, supporting business
  expansion into multiple regions.
* Developed infrastructure as code with Terraform modules; migrated legacy e-commerce
  systems from PAX Labs to JUUL Labs after the company split.

**[Senior Infrastructure Engineer, PAX Labs — San Francisco, CA (Hybrid), Nov 2016 – Jul 2017](https://pax.com)**
* Led expansion of AWS infrastructure from 4 to over 100 systems with autoscaling policies
  for high-traffic volumes.
* Standardized system deployment using Jenkins and Fabric, and implemented company-wide
  automated paging via PagerDuty.

**[Systems Engineer, study.com — Mountain View, CA, Sep 2014 – Sep 2016](https://study.com)**
* Led migration of cloud infrastructure from Rackspace to AWS, growing the fleet from 10
  to over 300 systems.
* Implemented full server lifecycle management with Packer, Puppet, PuppetDB, and Foreman,
  integrated with Jenkins and Rundeck.
* Developed and enforced a disaster-recovery plan safeguarding the data-warehouse project.
  Mentored the junior systems engineers on the team.

**Senior Linux Administrator, Meta Interfaces — San Francisco, CA (Hybrid), Oct 2012 – Sep 2014**
* Administered 1,000+ physical Linux servers and network hardware (Cisco, F5 BIG-IP) for a
  data center supporting high-demand streaming video.
* Led the initial AWS proof-of-concept that set the groundwork for cloud strategy, and
  replaced physical servers with a KVM / libvirt virtualized environment.
* Implemented monitoring with PagerDuty and Nagios.

## Selected projects & open source
- **[Audiophore](/page/audiophore/)** (Rust) — engine bridging VJ audio analysis
  (Synesthesia OSC) to real-time lighting across Hue, WLED, DMX / Art-Net, sACN / E1.31,
  and ILDA lasers. Sub-30 ms latency, Lua-scripted show files, Tauri + Svelte native app.
- **[obs-radio-output](/page/obs-radio-output/)** (C/C++) — native OBS Studio plugin
  streaming straight to Icecast / SHOUTcast. Public beta on macOS, Linux, and Windows.
- **[annoybots](/page/annoybots/)** (Go) — a single Go binary driving many IRC / Twitch /
  Discord networks at once over a shared Redis bus, with a Markov engine and sandboxed Lua
  plugins. Race-tested CI, multi-arch distroless images, GitOps (Flux) deployment on
  Kubernetes.
- **[claude-project-kit](/page/claude-project-kit/)** — open-source workflow kit that keeps
  AI-assisted coding grounded across repos: durable project memory, phased plans, and
  lifecycle commands, backed by a Bats test suite, CI, and ADRs. Adopted for personal and
  day-job delivery.
- **The bench stack** (Python) — [benchhud](/page/benchhud/),
  [bench-parts](/page/bench-parts/), and [benchhud-intake](/page/benchhud-intake/): an
  OpenCV / v4l2loopback compositor fusing microscope, thermal-imaging, and instrument
  telemetry into a single live video feed, backed by a separate self-hosted inventory
  service whose REST API the HUD and an intake service both consume. Runs on the cluster.
- **[3D Printer Models](/page/3d-printer-models/)** and
  **[Clickfinity](/page/clickfinity-openscad/)** (OpenSCAD) — thirty parametric models with
  CI-validated meshes and per-model releases, plus a clean-room magnet-free Gridfinity
  baseplate generator.
- **[recipe-card-maker](/page/recipe-card-maker/)** (Python / SvelteKit) — FastAPI backend,
  SvelteKit frontend, LLM-based recipe extraction feeding a Markdown-to-PDF pipeline.
  Containerized with CI and a full test suite.
- **[Snapmaker U1 tooling](/page/snapmaker-u1-tooling/)** (Shell / Swift) — binary analysis
  and patching scripts for vendor firmware images, RFID diagnostics, and an iOS app that
  writes OpenSpool NFC tags.

## Technical skills
- **Cloud & orchestration:** GCP · AWS · Azure · Kubernetes · AKS · Flux CD · GitOps · Helm
  · Docker · containerd · MetalLB · cert-manager · linkerd
- **Infrastructure as code:** Terraform · OpenTofu · Terragrunt · Ansible · Puppet · Packer
  · Atlantis
- **Observability & reliability:** Grafana · Prometheus · Mimir · Loki · Alloy
  (OpenTelemetry) · AlertManager · incident response · on-call · blameless post-mortems
- **CI/CD & tooling:** GitHub Actions · Jenkins · CircleCI · Rundeck · Fabric · Vault ·
  HAProxy · nginx · Kafka
- **Compliance:** SOX · SOC 2 · PCI-DSS control evidence · external audit support · change
  management
- **AI-assisted delivery:** Claude Code · agentic development workflow design · durable
  project context and memory systems · AI-assisted IaC authoring and review
- **Languages:** Python · Go · Rust · Bash · C/C++ · PHP · JavaScript
- **Platforms & data:** Linux (Ubuntu, RedHat, CentOS) · Windows Server · KVM / libvirt ·
  PostgreSQL · MySQL · SQL Server · MongoDB · Redis

## Earlier experience
- Computer Technician II — Elk Grove Unified School District, Elk Grove, CA — 2005 – 2012
- Developer & Systems Administrator — Groundworks Environmental, Folsom, CA — 2004
- Intern, Network Technologies — Stanislaus County Office of Education, Modesto, CA — 2003 – 2004
- Student Employee, Information Systems — Yosemite Community College District, Modesto, CA — 1999 – 2003

## Education
- A.S., Computer Science — Modesto Junior College, Modesto, CA — 2004
- Computer Programming Specialist Certificate — Modesto Junior College, Modesto, CA — 2003
- AWS Operations Bootcamp — AWS Summit, San Francisco, CA — 2013
