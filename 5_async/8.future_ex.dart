// https://www.youtube.com/watch?v=OTS-ap9_aXc

import 'dart:async';

main() {

  Future<int>.delayed(Duration(seconds: 3), () { 
                    // return 100; 
                    throw new NullThrownError();
                })
                .then((v)=>print(v))
                .catchError((err){
                    print('Caught $err');
                  },
                  test: (err) => err.runtimeType == NullThrownError
                )
                .whenComplete((){
                  print('All Finished');
                });


  print('Waiting...');

}