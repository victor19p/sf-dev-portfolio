# Domain Layer Implementation Exercise

## Overview
This exercise implements a basic Domain class and Apex trigger following the Domain-Driven Design pattern using the Apex Common library's `fflib_SObjectDomain` framework.

## Objective
Implement a Domain class with default and update logic that demonstrates:
- Domain-driven design principles in Salesforce
- Proper separation of concerns
- Trigger framework best practices using fflib_SObjectDomain

## Prerequisites
Before starting this exercise, ensure the following open source libraries are deployed:
- **ApexMocks** - For mocking framework support
- **Apex Common (fflib)** - For the SObjectDomain framework

## Implementation Details

### 1. Domain Class: `Accounts.cls`
**Location:** `force-app/main/default/classes/applyDomainLayer/Accounts.cls`

The domain class extends `fflib_SObjectDomain` and implements:

#### Key Features:
- **Constructor Pattern**: Implements the required constructor and `IConstructable` interface
- **Default Logic**: Sets default values when records are inserted
- **Update Logic**: Calculates Levenshtein distance on record updates

#### Methods Implemented:

##### `onApplyDefaults()`
- **Trigger Event**: Before Insert
- **Functionality**: Sets the `Description` field to "Domain classes rock!" for all new Account records

##### `onBeforeUpdate(Map<Id, sObject> existingRecords)`
- **Trigger Event**: Before Update
- **Functionality**: 
  - Calculates the Levenshtein distance between "Domain classes rock!" and the current `Description` field value
  - Stores the calculated distance in the `Annual Revenue` field
  - Uses Apex's built-in `getLevenshteinDistance()` method for string comparison

### 2. Trigger: `AccountsTrigger.trigger`
**Location:** `force-app/main/default/triggers/AccountsTrigger.trigger`

A comprehensive trigger that handles all DML operations:

```apex
trigger AccountsTrigger on Account (before insert, after delete, after insert, 
                                   after update, after undelete, before delete, 
                                   before update) {
    fflib_SObjectDomain.triggerHandler(Accounts.class);
}
```

#### Key Features:
- **All Trigger Events**: Covers all possible trigger contexts
- **Domain Delegation**: Delegates all logic to the Domain class through `fflib_SObjectDomain.triggerHandler()`
- **Clean Separation**: Keeps trigger code minimal and focused

## How It Works

### Insert Operation Flow:
1. New Account record is created
2. `AccountsTrigger` fires (before insert)
3. `fflib_SObjectDomain.triggerHandler()` routes to `Accounts` domain class
4. `onApplyDefaults()` method executes
5. `Description` field is automatically set to "Domain classes rock!"

### Update Operation Flow:
1. Account record is updated
2. `AccountsTrigger` fires (before update)
3. `fflib_SObjectDomain.triggerHandler()` routes to `Accounts` domain class
4. `onBeforeUpdate()` method executes
5. Levenshtein distance is calculated between "Domain classes rock!" and current `Description`
6. Result is stored in `Annual Revenue` field

## Benefits of This Pattern

### 1. **Separation of Concerns**
- Business logic is contained within the Domain class
- Triggers remain thin and focused on delegation
- Clear boundaries between data access and business rules

### 2. **Testability**
- Domain logic can be unit tested independently
- Mocking capabilities through ApexMocks integration
- Clear test boundaries and reduced coupling

### 3. **Maintainability**
- Centralized business logic for Account objects
- Consistent trigger handling across all DML operations
- Easy to extend with additional business rules

### 4. **Enterprise Patterns**
- Follows established enterprise architecture patterns
- Scalable approach for complex business logic
- Integration with Unit of Work pattern capabilities

## Usage Example

```apex
// Create new Account - Description will be auto-populated
Account newAccount = new Account(Name = 'Test Account');
insert newAccount;
// Result: Description = "Domain classes rock!"

// Update Account - Annual Revenue will be calculated
newAccount.Description = 'Different description';
update newAccount;
// Result: Annual Revenue = Levenshtein distance between 
//         "Domain classes rock!" and "Different description"
```

## Key Learning Points

1. **Domain-Driven Design**: Business logic belongs in Domain classes, not triggers
2. **Framework Usage**: Leveraging established frameworks reduces boilerplate code
3. **String Operations**: Practical use of Apex's `getLevenshteinDistance()` method
4. **Trigger Patterns**: How to implement comprehensive trigger coverage with minimal code
5. **Enterprise Architecture**: Building maintainable, testable business logic layers

## File Structure
```
force-app/main/default/
├── classes/applyDomainLayer/
│   ├── Accounts.cls              # Domain class implementation
│   └── Accounts.cls-meta.xml     # Metadata file
└── triggers/
    ├── AccountsTrigger.trigger    # Trigger implementation
    └── AccountsTrigger.trigger-meta.xml
```

## Next Steps
- Consider adding unit tests for the Domain class
- Explore additional domain methods (validation, calculations, etc.)
- Implement error handling and logging
- Add integration with other enterprise patterns (Unit of Work, Selectors)
