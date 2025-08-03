# Salesforce Certification Study Guide Portfolio

This repository contains my collection of Trailhead exercises, development frameworks, and enterprise architecture patterns for Salesforce certification studies.

## 📚 Project Content

### Trailhead & Certification Exercises
- **Apex Classes**: Async processing, Schedulable, Platform Cache, REST APIs
- **Lightning Web Components**: Reactive properties, event handling, data binding, forms
- **Test Classes**: Unit testing with best practices and coverage

### Enterprise Architecture Patterns
- **ApexMocks Framework**: Mockito-inspired mocking framework for advanced unit testing
- **Unit of Work Pattern**: Pattern for transactional DML operations management
- **Trigger Frameworks**: Multiple implementations (Kevin O'Hara, David Schach, Delegator Pattern)

### Practical Examples
- Lightning Web Components with different UI/UX patterns
- REST API and services implementations
- Platform Cache for performance optimization
- Asynchronous and batch processing

## 🏗️ Project Structure

```
force-app/main/default/
├── classes/                 # Apex Classes & Frameworks
│   ├── apex-mocks/         # Mocking framework for tests
│   ├── EnterprisePattern-UnitOfWork/  # Unit of Work Pattern
│   ├── sf-trigger-framework-dschach/  # Trigger Framework v2
│   └── trigger-handler-delegator-pattern/  # Delegator Pattern
├── lwc/                    # Lightning Web Components
│   ├── example1_*/         # Basic LWC exercises
│   ├── example2_*/         # Interaction patterns
│   ├── example3_*/         # Form handling
│   ├── example4_*/         # Tables and data display
│   └── account*/           # Search and finder patterns
├── flexipages/             # Lightning Pages for examples
└── triggers/               # Trigger implementations
```

## 🎯 Certification Topics Covered

### Platform Developer I
- ✅ Apex Fundamentals (Classes, Methods, Exception Handling)
- ✅ Asynchronous Apex (`@future`, `Schedulable`, Batch)
- ✅ Lightning Web Components (Properties, Events, Data Binding)
- ✅ Platform Cache Implementation
- ✅ REST API Development
- ✅ Unit Testing & Test Coverage

### Platform Developer II
- ✅ Enterprise Design Patterns
- ✅ Advanced Apex Testing (Mocking, Test Data Factory)
- ✅ Trigger Design Patterns & Best Practices
- ✅ Integration Patterns & APIs
- ✅ Performance Optimization

## 🔧 Included Frameworks

| Framework | Purpose | Source |
|-----------|---------|--------|
| **ApexMocks** | Unit Testing with Mocks | Mockito-inspired |
| **fflib Unit of Work** | Transactional DML Pattern | FinancialForce |
| **Trigger Framework (K. O'Hara)** | Trigger Management | GitHub Community |
| **Trigger Framework (D. Schach)** | Advanced Trigger Handling | GitHub Community |
| **Delegator Pattern** | Trigger Architecture | Custom Implementation |

## 🚀 Useful Commands

### Basic Development Workflow
```bash
# Create a scratch org
sf org create scratch -f config/project-scratch-def.json -a StudyOrg

# Deploy all metadata
sf project deploy start -o StudyOrg

# Deploy specific component
sf project deploy start --metadata ApexClass:AccountProcessor -o StudyOrg

# Deploy using manifest
sf project deploy start --manifest manifest/package.xml -o StudyOrg

# Run tests
sf apex run test -o StudyOrg -w 5

# Open org
sf org open -o StudyOrg
```

### Retrieve & Deploy Commands
```bash
# Retrieve using manifest
sf project retrieve start --manifest manifest/package.xml

# Retrieve specific class by source path
sf project retrieve start --source-dir force-app/main/default/classes/AccountProcessor.cls

# Retrieve specific LWC by source path
sf project retrieve start --source-dir force-app/main/default/lwc/accountFinder

# Retrieve by metadata type and name
sf project retrieve start --metadata ApexClass:AccountProcessor

# Retrieve entire classes folder
sf project retrieve start --source-dir force-app/main/default/classes

# Deploy specific class by source path
sf project deploy start --source-dir force-app/main/default/classes/AccountProcessor.cls

# Deploy specific LWC by source path
sf project deploy start --source-dir force-app/main/default/lwc/accountFinder

# Deploy with validation only (dry-run)
sf project deploy start --manifest manifest/package.xml --dry-run

# Deploy with specific tests
sf project deploy start --manifest manifest/package.xml --test-level RunSpecifiedTests --tests AccountProcessorTest
```

### Org Management
```bash
# List available orgs
sf org list

# Authenticate to new org
sf org login web --alias MyOrg

# View org info
sf org display --target-org MyOrg

# Delete scratch org
sf org delete scratch --target-org StudyOrg
```

## Read All About It

- [Salesforce Extensions Documentation](https://developer.salesforce.com/tools/vscode/)
- [Salesforce CLI Setup Guide](https://developer.salesforce.com/docs/atlas.en-us.sfdx_setup.meta/sfdx_setup/sfdx_setup_intro.htm)
- [Salesforce DX Developer Guide](https://developer.salesforce.com/docs/atlas.en-us.sfdx_dev.meta/sfdx_dev/sfdx_dev_intro.htm)
- [Salesforce CLI Command Reference](https://developer.salesforce.com/docs/atlas.en-us.sfdx_cli_reference.meta/sfdx_cli_reference/cli_reference.htm)
