# Performance Engineering POC

Hands-on Performance Engineering and API Performance Testing POC using Apache JMeter and a Spring Boot REST API.

The project demonstrates workload modeling, baseline/load/stress testing, controlled throughput, SLA validation, CSV parameterization, JWT correlation, authenticated performance testing, non-GUI execution, JTL result collection, and HTML performance reporting.

---

## 1. Objectives

- Build and execute a JMeter performance test plan from scratch
- Understand workload modeling and ramp-up behavior
- Execute baseline, load, sustained-load, and stress experiments
- Measure throughput, response time, percentiles, and errors
- Apply response-time SLAs
- Perform data-driven testing using CSV parameterization
- Implement JWT token correlation in JMeter
- Model login-once-per-user behavior
- Execute performance tests in non-GUI mode
- Generate JMeter HTML dashboards from JTL results
- Investigate and distinguish load-generator limitations from application behavior

---

## 2. Technology Stack

| Technology | Usage |
|---|---|
| Java 21 | Application/runtime |
| Spring Boot 4.1.1 | REST API |
| Spring Security | API authentication |
| JJWT 0.13.0 | JWT generation/validation |
| Apache JMeter 5.6.3 | Performance testing |
| PowerShell | Resource monitoring / execution |
| Git / GitHub | Version control and project publication |

---

## 3. Application Under Test

The POC contains a lightweight Spring Boot REST API.

### Product API

```text
GET /api/products
GET /api/products/{id}