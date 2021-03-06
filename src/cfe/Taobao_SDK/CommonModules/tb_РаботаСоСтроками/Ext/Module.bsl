
Функция В_JSON(СоответствиеДанные, Отказ = Ложь) Экспорт
	
	ИспользоватьДвойныеКавычки = Истина;
	ЭкранироватьСлэш = Ложь;
	
	ПараметрыЗаписиJSON = Новый ПараметрыЗаписиJSON(ПереносСтрокJSON.Нет);
	Попытка
		
		ЗаписьJSON = Новый ЗаписьJSON;
		ЗаписьJSON.УстановитьСтроку(ПараметрыЗаписиJSON);
		
		ЗаписатьJSON(ЗаписьJSON, СоответствиеДанные);
		
		СтрокаДанные = ЗаписьJSON.Закрыть();
		
		Возврат СтрокаДанные;
		
	Исключение
		
		Отказ = Истина;
		Сообщить(ОписаниеОшибки());
		
		Возврат Неопределено;
		
	КонецПопытки;
	
КонецФункции

Функция В_JSON_СимволыВнеASCII(СоответствиеДанные, Отказ = Ложь) Экспорт
	
	ИспользоватьДвойныеКавычки = Истина;
	ЭкранироватьСлэш = Ложь;
	
	ПараметрыЗаписиJSON = Новый ПараметрыЗаписиJSON(ПереносСтрокJSON.Нет,,,ЭкранированиеСимволовJSON.СимволыВнеASCII);
	Попытка
		
		ЗаписьJSON = Новый ЗаписьJSON;
		ЗаписьJSON.УстановитьСтроку(ПараметрыЗаписиJSON);
		
		ЗаписатьJSON(ЗаписьJSON, СоответствиеДанные);
		
		СтрокаДанные = ЗаписьJSON.Закрыть();
		
		ЗаменитьНаЮникодСпецСимволы(СтрокаДанные);
		
		Возврат СтрокаДанные;
		
	Исключение
		
		Отказ = Истина;
		Сообщить(ОписаниеОшибки());
		
		Возврат Неопределено;
		
	КонецПопытки;
	
КонецФункции

Функция ИЗ_JSON(Строка_JSON, Отказ = Ложь) Экспорт
	
	Попытка
		
		ЧтениеJSON = Новый ЧтениеJSON;
		ЧтениеJSON.УстановитьСтроку(Строка_JSON);
		
		Возврат ПрочитатьJSON(ЧтениеJSON, Истина);
		
	Исключение
		Отказ = Истина;
		Сообщить(ОписаниеОшибки());
		
		Возврат Неопределено;
		
	КонецПопытки;
	
	
КонецФункции

Процедура ЗаменитьНаЮникодСпецСимволы(Строка)
		
	СтрокаСпецСимволов = "+-?&%";
	
	Для Счетчик = 1 По СтрДлина(СтрокаСпецСимволов) Цикл      
		
		СпецСивол = Сред(СтрокаСпецСимволов, Счетчик, 1);
		
		Если СтрНайти(Строка, СпецСивол) > 0 Тогда
			
			СимволЮникод = DecToAny(КодСимвола(СпецСивол), 16);
			
			СимволЮникод = "00000" + СимволЮникод;
			СимволЮникод = Прав(СимволЮникод, 4);
			СимволЮникод = "\u" + СимволЮникод;
			
			Строка = СтрЗаменить(Строка, СпецСивол, СимволЮникод);
			
		КонецЕсли;
		
	КонецЦикла;
	
КонецПроцедуры

Функция DecToAny(Знач тЗначение, тОснование)
   тРезультат = "";
 
   Пока тЗначение > 0 Цикл
      тРезультат = Сред("0123456789abcdefghijklmnopqrstuvwxyz", тЗначение%тОснование + 1, 1) + тРезультат;
      тЗначение = Цел(тЗначение/тОснование) ;
   КонецЦикла;
 
   Возврат тРезультат;
КонецФункции


