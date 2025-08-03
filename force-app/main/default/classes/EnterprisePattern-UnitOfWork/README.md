# Unit of Work Pattern (fflib_SObjectUnitOfWork)

This pattern encapsulates DML operations to avoid multiple scattered calls to `insert/update/delete`.

- Allows registering multiple related objects before making a single `commitWork()` call
- Helps maintain clean and transactional logic
- Comes from FinancialForce's `apex-common` repository

## Reference:
- GitHub Repository: [fflib-apex-common](https://github.com/apex-enterprise-patterns/fflib-apex-common)

## Included:
- `fflib_ISObjectUnitOfWork.cls`
- `fflib_SObjectUnitOfWork.cls`
- `fflib_SObjectUnitOfWorkTest.cls`

