import Foundation

/*                  -- 1 --
 შექმენით function რომლის მეშვეობითაც გამოითვლით ფაქტორიალს. function იღებს ერთ Int ტიპის ცვლადს და აბრუნებს ფაქტორიალს, ანუ მაგალითად თუ გადავაწვდით 5-იანს function-მა უნდა დაგვიბრუნოს 120 რომელიც მიიღო შემდეგი გამოთვლის შედეგად 5*4*3*2*1. არ გამოიყენოთ მზა ფუნქციები.
 */
var finalNumber: Int = 1
func factorial(_ numb: Int) -> Int{
    if numb != 0{
        for i in 1...numb{
            finalNumber = finalNumber * i
        }
    }else{
        return finalNumber
    }
    
    return finalNumber
}
print(factorial(5))
print()






/*                  -- 2 --
 შექმენით function რომელიც აგენერირებს ფიბონაჩის პირველ 20 რიცხვს. არ გამოიყენოთ მზა ფუნქციები.
 */
func findFibos(fiboNumber: Int = 20) -> [Int] {
    var numbers = [0, 1]
    while numbers.count < fiboNumber{
        numbers.append((numbers[numbers.count - 1] + numbers[numbers.count - 2]))
    }
    return numbers
}
print(findFibos())
print()







/*                  -- 3 --
 შექმენით function რომელიც მიიღებს String-ს, function-მა უნდა შეამოწმოს პალინდრომია (წინიდანაც და უკნიდანაც იკითხება ერთნაირად) თუ არა ეს String-ი. მაგალითად "racecar" ამ შემთხვევაში ფუნქციამ უნდა დააბრუნოს true. არ გამოიყენოთ მზა ფუნქციები. შეგიძლიათ მეორე solution-ი მზა ფუნქციის გამოყენებით გვაჩვენოთ.
 */
func isPalindrome(_ input: String) -> Bool {
    let inputLowerCased = input.lowercased()
    let characters = Array(inputLowerCased)
    let length = characters.count
    
    for i in 0..<length/2 {
        if characters[i] != characters[length - 1 - i] {
            return false
        }
    }
    return true
}
print(isPalindrome("MurderForAJarOfRedRum"))
print()







/*                  -- 4 --
 შექმენით function რომელიც გადაცემულ რიცხვების array-ს ააკვარდატებს, დაპრინტავს და დააბრუნებს მნიშვნელობას.
 */
var initialArray = [2.4, 5, 7.7, 10]
func squareNumbers(initials: [Double]) -> [Double]{
    var finalSquare: [Double] = initials.map{$0 * $0}
    print(finalSquare)
    return finalSquare
}
squareNumbers(initials: initialArray)
print()








/*                  -- 5 --
 შექმენით function რომელიც დაითვლის სიტყვების რაოდენობას String-ში, ფუნქციამ უნდა მიიღოს String-ი, და დააბრუნოს dictionary, სიტყვებით და იმ რაოდენობით რამდენჯერ იყო ერთი და იგივე სიტყვა გამოყენებული String-ში. uppercase და lowercase ასოები უნდა იყოს დაჰენდლილი ერთნაირად, მაგალითად თუ function-s გადავაწვდით "TBC x USAID, tbc it academy, we are in TBC academy." function-მა უნდა დააბრუნოს ["tbc": 3, "academy": 2, "we": 1, "are": 1, "in": 1, "it": 1, "x": 1]
 */
func countSins(_ inputString: String) -> [String: Int]{
    var wordsCount = [String: Int]()
    let sins = inputString.components(separatedBy: CharacterSet(charactersIn: " ,.!-:"))
    
    for sin in sins{
        let lowercasedSin = sin.lowercased()
        if !lowercasedSin.isEmpty {
            wordsCount[lowercasedSin, default: 0] += 1
        }
    }
    return wordsCount
}

let sevenDeadlySins = "There are seven deadly sins: Meliodas - the sin of Wrath, Diane - the sin of Envy, Ban - the sin of Greed, King - the sin of Sloth, Merlin - the sin of Gluttony, Gowther - the sin of Lust, and my favourite Escanor - the sin of Pride"
print(countSins(sevenDeadlySins))
print()







/*                  -- 6 --
 შექმენით Closure რომელსაც გადაეცემა რიცხვი და დააბრუნებს ამ რიცხვის ორობით ჩანაწერს.
 */
let binaryNumber: (Int) -> String = {
    number in return String(number, radix: 2)
}
print("Binary of \(42) is \(binaryNumber(42))")
print()








/*                  -- 7 --
 შექმენით Closure რომელიც გაფილტრავს(ანუ წაშლის) კენტ რიცხვებს Int-ების Array-დან.
 */
let removeOdds: ([Int]) -> [Int] = { numbers in
    return numbers.filter { $0 % 2 == 0 }
}

let numbersArray = [2, 4, 5, 7, 9, 8, 3]
print(removeOdds(numbersArray))
print()







/*                  -- 8 --
 შექმენით Closure რომელიც დამაპავს(ანუ გააკეთებს ქმედებას ყველა მასივის ელემენტზე) Int-ების Array-ის და თითოეულ ელემენტს გაათმაგებს.
 */
let makeTenTimesBigger: ([Int]) -> [Int] = { numbers in
    return numbers.map {$0 * 10}
}

let afterTenYears = [22, 35, 87, 91]
print(makeTenTimesBigger(afterTenYears))
print()







/*                  -- 9 --
 გამოიყენეთ escaping closure სადაც 3 წამის შემდეგ დაბეჭდავს ჩაწოდებული მასივის ჯამს.
 */
func thisIsKillingMe(_ numbers: [Int], completion: @escaping (Int) -> Void) {
    DispatchQueue.global().asyncAfter(deadline: .now() + 3.0){
        let numbersSum = numbers.reduce(0, +)
        completion(numbersSum)
    }
}

let arrayToInput = [14, 420, 290, 244]
thisIsKillingMe(arrayToInput) { numbersSum in
    print(numbersSum)
}
print()







/*                  -- 10 --
 function-ს გადავცეთ String-ების array და დაგვიბრუნოს მხოლოდ კენტი რიცხვების მასივი. გამოიყენეთ high order functions.
 */
func filterOddNumbers(_ inputArray: [String]) -> [Int] {
    let filteredArray = inputArray
        .compactMap { Int($0) }
        .filter { $0 % 2 != 0 }
    return filteredArray
}
let inputArray = ["23", "16", "26", "3", "6", "9", "7", "12", "91"]
print(filterOddNumbers(inputArray))


