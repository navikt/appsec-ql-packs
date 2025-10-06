/**
 * @name Example security query for JavaScript
 * @description An example query to demonstrate custom security checks
 * @kind problem
 * @problem.severity warning
 * @precision high
 * @id navikt/example-js-security-query
 * @tags security
 *       external/cwe/cwe-079
 */

import javascript

from Function f
where
  f.getName() = "handleUserInput" and
  not exists(f.getACall())
select f, "Unused function that handles user input may indicate dead code or incomplete implementation."
