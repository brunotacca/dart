/**
 * Like JavaScript promises, `then` and `catchError` method also return another `Future` object.
 * The individual callback function passed to `then` and `catchError` method act as an `executor` function.
 * Using these principles, it is possible to chain a `then` method on another `then` method.
 *
 * Then chaining is used to perform asynchronous jobs in series.
 * It is a standard practice to chain multiple `then` callback but have only one `catchError` callback
 * to handle error happended in any chained `then` callback.
 */
void main() {
  // create future object that executes the `executor` function after `3` seconds
  Future<String> future =
      Future.delayed(Duration(seconds: 3), () => "Hello from the future");

  // listen to `Future` object
  future

      // 1. executes when `Future` object resolves
      .then((result_of_1) => "$result_of_1: FIRST")

      // executes when previous `then` method returns a value (resolves)
      // 2. returns a future object with a string value
      .then((result_of_2) => "$result_of_2: SECOND")

      // executes when previous `then` method returns a value (resolves)
      // 3. returns a future object with a string value
      .then((result_of_3) {
        // int a = 1; return a; // This line will make the value chaining useless since all of it is at $result_of_3
        return "$result_of_3: THIRD";
      })

      // 4. executes when previous `then` method returns a value (resolves)
      // 4. This is the last THEN, so it will finish here, no need to return again.
      .then((result_of_4) {
        // Last Then - Will return the Future Object in case of SUCCESS and will NOT TRIGGER CatchError.
        // Returned `Future` object ALWAYS resolves.
        
        // Notice from the output that the param is stacked, chained through the 'then' function's params.
        print("$result_of_4: FOURTH (SUCCESS).");

        // Returning here (last then) will ignore all the chained operations
        //  because you would be returning another FUTURE object, and this time without a success then condition
        // return "$result_of_4: FOURTH";  
        // return; 

        // However, if you throw an error here, it will still call to the catchError.
        // Which doesn't make sense (semantically) since this is the LAST THEN, meaning the SUCCESS CONDITION.
        throw FormatException('Oopsy method 4.');
      })

      // gets called when an exception occurs in the original `future` object
      // or in any of the `then` method callback functions
      .catchError((error) {
        print('Error: $error');
      });

  // just a simple statement
  print('Job is done!');
}
