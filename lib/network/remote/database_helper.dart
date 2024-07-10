import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
class DatabaseHelper{

  static Database? _db ;
  Future<Database?>get db async {
    if(_db == null ){
      _db = await intialDatabase();
      return _db;
    }else{
      return _db;
    }
  }

  intialDatabase()async {
    String DatabasePath = await getDatabasesPath();
    String path = join(DatabasePath , "OldStudent.db");
    Database OldStudentDb = await openDatabase(path, onCreate: _onCreate ,
        version: 3 , onUpgrade: _onUpgrade);
    return OldStudentDb ;
  }

  _onUpgrade(Database db , int oldVersion , int newVersion ){
   print("onUpgrade==================");
  }

  _onCreate(Database db , int version) async {
    await db.execute('''
       CREATE TABLE studentInfo(
       "id" INTEGER  PRIMARY KEY AUTOINCREMENT , 
       "StudentName" Text  ,
       "StudentNationalId" TEXT NOT NULL , 
       "StudentType" INTEGER NOT NULL ,
       StudentCode TEXT NOT NULL , 
       "StudentBirthDate" TEXT NOT NULL, 
       "StudentReligion" INTEGER NOT NULL, 
       "StudentGovernorate" INTEGER NOT NULL, 
       "StudentCity" INTEGER NOT NULL, 
       "StudentAddress" TEXT NOT NULL, 
       "StudentPhone" TEXT NOT NULL, 
       "StudentMobile" TEXT NOT NULL
       
       );
       
        ''');
    await db.execute('''
       CREATE TABLE "parentInfo"(
       "id" INTEGER   PRIMARY KEY AUTOINCREMENT , 
       "FatherNationalId" TEXT NOT NULL , 
       "ParentNationalId" TEXT NOT NULL, 
       "FatherName" TEXT NOT NULL, 
       "ParentName" TEXT NOT NULL, 
       "FatherMobile" TEXT NOT NULL, 
       "ParentMobile" TEXT NOT NULL, 
       "FatherJob" TEXT NOT NULL, 
       "ParentRelation" TEXT NOT NULL, 
        "FamilyOutValue" INTEGER NOT NULL,
        "ParentStatus" INTEGER NOT NULL
       
       );
''');
    await db.execute('''
       CREATE TABLE "facultyInfo"(
       "id" INTEGER  PRIMARY KEY AUTOINCREMENT , 
       "emailController" TEXT NOT NULL , 
       "passwordController" TEXT NOT NULL, 
       "confirmPasswordController" TEXT NOT NULL, 
       "percentController" TEXT NOT NULL, 
       "departmentController" TEXT NOT NULL, 
       "selectedCollage" INTEGER NOT NULL, 
       "selectedLevel" INTEGER NOT NULL, 
       "dropScorePerson" INTEGER NOT NULL, 
       "previousHousingPerson" TEXT NOT NULL,
       "dropHousingType" TEXT NOT NULL,
       "withFood" BOOLEAN NOT NULL,
       "specialPeople" BOOLEAN NOT NULL
       
       );
''');
    print("ocCreate============================");
  }

  readData(String sql)async {
    Database? mydb = await db ;
    List<Map> response = await mydb!.rawQuery(sql) ;
    return response ;
  }

  insertData<T>(String sql, List<T> list)async {
    Database? mydb = await db ;
    int response = await mydb!.rawInsert(sql,list) ;
    return response ;
  }

  updateData(String sql)async {
    Database? mydb = await db ;
    int response = await mydb!.rawUpdate(sql) ;
    return response ;
  }

  deleteData(String sql)async {
    Database? mydb = await db ;
    int response = await mydb!.rawDelete(sql) ;
    return response ;
  }
}