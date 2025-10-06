/**
 * @name Example security query for Go
 * @description An example query to demonstrate custom security checks
 * @kind problem
 * @problem.severity warning
 * @precision high
 * @id navikt/example-go-security-query
 * @tags security
 *       external/cwe/cwe-079
 */

import go

from Function f
where
  f.getName() = "ProcessUserInput" and
  not exists(f.getACall())
select f, "Unused function that processes user input may indicate dead code or incomplete implementation."
