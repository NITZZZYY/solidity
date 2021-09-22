contract C {
	function testFunction() external {}

	function testYul() public {
		function() external fp = this.testFunction;

		assembly {
			fp.selector := 0x12345678
		}
	}
	function testSol() public {
		this.testFunction.selector = bytes4(bytes32(uint256(0x1234568)));
	}
}
// ----
// TypeError 1259: (143-154): ".selector" and ".address" for external function pointers cannot be assigned to.
// TypeError 4247: (207-233): Expression has to be an lvalue.
