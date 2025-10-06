/**
 * @name Example security query for Python
 * @description An example query to demonstrate custom security checks
 * @kind problem
 * @problem.severity warning
 * @precision high
 * @id navikt/example-py-security-query
 * @tags security
 *       external/cwe/cwe-079
 */

import python

from Function f
where
  f.getName() = "process_user_input" and
  not exists(Call c | c.getFunc() = f.getAReference())
select f, "Unused function that processes user input may indicate dead code or incomplete implementation."
