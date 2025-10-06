/**
 * @name Example security query for Java
 * @description An example query to demonstrate custom security checks
 * @kind problem
 * @problem.severity warning
 * @precision high
 * @id navikt/example-security-query
 * @tags security
 *       external/cwe/cwe-079
 */

import java

from Method m
where
  m.getName() = "processUserInput" and
  not exists(m.getAReference())
select m, "Unused method that processes user input may indicate dead code or incomplete implementation."
