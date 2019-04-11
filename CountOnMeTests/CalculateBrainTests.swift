//
//  CalculateBrainTests.swift
//  CountOnMeTests
//
//  Created by ISABELLE Terwagne on 08/04/2019.
//  Copyright © 2019 Ambroise Collon. All rights reserved.
//

import XCTest
@testable import CountOnMe
class CalculateBrainTests: XCTestCase {

    var brain: CalculateBrain!
    
    override func setUp() {
       super.setUp()
        brain = CalculateBrain()
        
    }
        
// testing isExpressionCorrect
    func testGivenStringNumbersIsEmpty_whenisExpressionCorrectTriggered_thenSendsFalse(){
        brain.stringNumbers = [String()]
        XCTAssertFalse(brain.isExpressionCorrect)
    }
    
    func testGivenStringNumbersHasEmptyString_whenisExpressionCorrectTriggered_thenSendsFalse(){
        brain.stringNumbers = [""]
        XCTAssertFalse(brain.isExpressionCorrect)
    }
    func testGivenStringNumbersHasOneMember_whenisExpressionCorrectTriggered_thenSendsTrue(){
        brain.stringNumbers = ["1"]
        XCTAssertTrue(brain.isExpressionCorrect)
    }
    func testGivenStringNumbersIsEmptyAndOperatorIsPlus_whenisExpressionCorrectTriggered_thenSendsfalse(){
        brain.stringNumbers = [String()]
        brain.operators = ["+"]
        XCTAssertFalse(brain.isExpressionCorrect)
    }
    func testGivenStringNumbersHasEmptyStringAndOperatorIsPlus_whenisExpressionCorrectTriggered_thenSendsfalse(){
        brain.stringNumbers = [""]
        brain.operators = ["+"]
        XCTAssertFalse(brain.isExpressionCorrect)
    }
    func testGivenStringNumbersIs100AndOperatorIsPlus_whenisExpressionCorrectTriggered_thenSendstrue(){
        brain.stringNumbers = ["100"]
        brain.operators = ["+"]
        XCTAssertTrue(brain.isExpressionCorrect)
    }
    func testGivenStringNumbersIsEmptyAndOperatorIsMinus_whenisExpressionCorrectTriggered_thenSendsfalse(){
        brain.stringNumbers = [String()]
        brain.operators = ["-"]
        XCTAssertFalse(brain.isExpressionCorrect)
    }
    func testGivenStringNumbersHasEmptyStringAndOperatorIsminus_whenisExpressionCorrectTriggered_thenSendsfalse(){
        brain.stringNumbers = [""]
        brain.operators = ["-"]
        XCTAssertFalse(brain.isExpressionCorrect)
    }
    func testGivenStringNumbersLastIsEmpty_whenisExpressionCorrectTriggered_thenSendsfalse(){
        brain.stringNumbers = ["", ""]
        brain.operators = ["-"]
        XCTAssertFalse(brain.isExpressionCorrect)
    }
    
    func testGivenStringNumbersIs100AndOperatorIsMinus_whenisExpressionCorrectTriggered_thenSendstrue(){
        brain.stringNumbers = ["100"]
        brain.operators = ["-"]
        XCTAssertTrue(brain.isExpressionCorrect)
    }
    func testGivenStringNumbersIsEmptyAndOperatorIsPercent_whenisExpressionCorrectTriggered_thenSendsfalse(){
        brain.stringNumbers = [String()]
        brain.operators = ["%"]
        XCTAssertFalse(brain.isExpressionCorrect)
    }
    func testGivenStringNumbersHasoneStringAndOperatorIsPercent_whenisExpressionCorrectTriggered_thenSendsfalse(){
        brain.stringNumbers = [""]
        brain.operators = ["%"]
        XCTAssertFalse(brain.isExpressionCorrect)
    }
    
    func testGivenStringNumbersIs100AndOperatorIsPercent_whenisExpressionCorrectTriggered_thenSendstrue(){
        brain.stringNumbers = ["100"]
        brain.operators = ["%"]
        XCTAssertTrue(brain.isExpressionCorrect)
    }
    
     func testGivenStringNumbersHasOnedecimalMember_whenisExpressionCorrectTriggered_thenSendsTrue(){
        brain.stringNumbers = ["100.25"]
        XCTAssertTrue(brain.isExpressionCorrect)
    }
    func testGivenStringNumbersHas2numbers_whenisExpressionCorrectTriggered_thenSendsTrue(){
        brain.stringNumbers = ["10","11"]
        XCTAssertTrue(brain.isExpressionCorrect)
    }
    
//    testingcanAddOperator
    func testGivenStringNumbersIsEmpty_whenAddOperator_thenCanAddOperatorIsFalse() {
        brain.stringNumbers = [String()]
        XCTAssertFalse(brain.canAddOperator)
    }
    
    func testGivenStringNumberscountishalfEmpty_whenAddOperator_thenCanAddOperatoirIsFalse() {
        brain.stringNumbers = [""]
        XCTAssertFalse(brain.canAddOperator)
    }
    
    func testGivenStringNumbersContainsOneChar_whenAddNumberIsTriggered_thenSendsTrue(){
        brain.stringNumbers = ["1"]
        XCTAssertTrue(brain.canAddOperator)
    }

    func testGivenStringNumbersIsEmpty_whenAddNumber_thenCanAddOperatorIsTrue() {
        brain.stringNumbers = [String()]
        brain.addNewNumber(100)
        XCTAssertTrue(brain.canAddOperator)
    }
    
    func testGivenNumberArrayLastItemIsNotEmpty_WhenAddingMinus_ThenCanAddOperationSymbolShouldReturnTrue() {
        brain.stringNumbers = ["3", "5"]
        
        brain.operators.append("-")
        
        XCTAssertTrue(brain.canAddOperator == true)
    }
    
    
 // testing canAddDecimal
    func testGivenStringNumberIsEmpty_whenAddDecimal_thenCanAddDecismalIsFalse(){
        brain.stringNumbers = [String()]
        XCTAssertFalse(brain.canAddDecimal)
    }
    func testGivenStringNumberContainPoint_whaneAddDecimal_thenCanAddDecimalIsFalse() {
        brain.stringNumbers = ["."]
        XCTAssertFalse(brain.canAddDecimal)
    }
    func testGivenStringNumberis1_whenAddDecimal_thenCanAddDecimalIsTrue() {
        brain.stringNumbers = ["1"]
        XCTAssertTrue(brain.canAddDecimal)
    }
    
    
    func testGivenStringNumberIs100_WhenAddDecimal_ThenPointIsAppear() {
        brain.stringNumbers = ["100"]
        brain.addDecimal()
        XCTAssertEqual(brain.stringNumbers, ["100."])
    }
    func testGivenStringNumberIs100Point_WhenAddDecimal_ThenCanAddDecimalIsFalse() {
        brain.stringNumbers = ["100."]
        brain.addDecimal()
        XCTAssertFalse(brain.canAddDecimal)
    }
   
//testing addNewNumber
func testGivenStringNumberIsEmpty_WhenAddnumber_ThenNumberIsStored() {
        brain.stringNumbers = [""]
        brain.addNewNumber(1)
        XCTAssertEqual(brain.stringNumbers, ["1"])
    }
func testGivenStringNumberIs1_WhenAddnumber_ThenNewNumberIsStored() {
        brain.stringNumbers = ["1"]
        brain.addNewNumber(1)
        XCTAssertEqual(brain.stringNumbers, ["11"])

    }
    
//    testing plus
    func testGivenStringNumberIs10_whenPlustapped_addNewNumber() {
        brain.stringNumbers = ["10"]
        brain.plus()
        XCTAssertEqual(brain.stringNumbers, ["10", ""])
    }
    
    //    testing minus
    func testGivenStringNumberIs15_whenMinustapped_addNewNumber() {
        brain.stringNumbers = ["10"]
        brain.minus()
        XCTAssertEqual(brain.stringNumbers, ["10", ""])
    }
    //    testing Percent
    func testGivenStringNumberIs100_when5PercentisTapped_addnewNumberTwice() {
        brain.stringNumbers = ["100", "5"]
        brain.percent()
        XCTAssertEqual(brain.stringNumbers, ["100", "5", "5"])
    }
    // testing calculateTotal
    func testGivenstringNumberisEmpty_whenEqualButtonIsTapped_isExpressionIsCorrectisFalse() {
        brain.stringNumbers = [String()]
        brain.calculateTotal()
        XCTAssertFalse(brain.isExpressionCorrect)
    }
    func testGivenStringNumberisdouble_whenequalButtonisTapped_thenreturnNil(){
        brain.stringNumbers = ["4.5", "6.8"]
        brain.operators = ["",""]
        brain.calculateTotal()
        XCTAssertTrue(brain.canAddOperator)
    }
    
    func testGivenStringNumberis4And5_WhenPlusPressed_ThenTotalShouldBe9() {
        brain.stringNumbers = ["4", "5"]
        brain.operators = ["+", "+"]
        brain.calculateTotal()
     XCTAssertTrue(brain.isExpressionCorrect)
        XCTAssertEqual(brain.total,9.0)
    }
    
    func testGivenStringNumberisDecimal_WhenPlusPressed_ThenTotalShouldBedecimal() {
        brain.stringNumbers = ["4.2", "5.2"]
        brain.operators = ["+", "+"]
        brain.calculateTotal()
        XCTAssertTrue(brain.isExpressionCorrect)
        XCTAssertEqual(brain.total,9.4)
    }
    func testGivenStringNumberis10And5_WhenMinusPressed_ThenTotalShouldBe5() {
        brain.stringNumbers = ["10", "5"]
        brain.operators = ["+", "-"]
        brain.calculateTotal()
        XCTAssertTrue(brain.isExpressionCorrect)
        XCTAssertEqual(brain.total, 5.0)
 
    }
    func testGivenStringNumbersIs100And50_WhenPlusPressed_ThenTotalShoulbBe150(){
        brain.stringNumbers = ["100", "50"]
        brain.operators = ["+", "+"]
        brain.calculateTotal()
        XCTAssertTrue(brain.isExpressionCorrect)
        XCTAssertEqual(brain.total, 150.0)
    }
    func testGivenStringNumberIs100And50_WhenPercentPressed_ThenAppendTotaltoStringNumberAndTotalShouldBe50() {
        brain.stringNumbers = ["100", "50", "50"]
        brain.operators = ["+", "-", "%"]
        brain.calculateTotal()
        XCTAssertTrue(brain.isExpressionCorrect)
        XCTAssertEqual(brain.total,50.0)
    }
 
  
    func testGivenResultIsStored_WhenclearButtontapped_thenAllValuesAreReset() {
        brain.stringNumbers = ["10", "2"]
        brain.operators = ["+","+"]
        brain.total = 12.0
        brain.clearButton()
        XCTAssert(brain.stringNumbers == [String()])
        XCTAssert(brain.operators == ["+"])
        XCTAssert(brain.total == 0.0)
    }
}
