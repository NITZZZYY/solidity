contract C {
	function testFunction() external {}

	function testYul() public returns (address adr) {
		function() external fp = this.testFunction;

		assembly {
			fp.address := 0x1
		}
	}
	function testSol() public returns (address) {
		return this.testFunction.address = address(0x1);
	}
}
// ----
// TypeError 1259: (165-175): ".selector" and ".address" for external function pointers cannot be assigned to.
// TypeError 4247: (246-271): Expression has to be an lvalue.
