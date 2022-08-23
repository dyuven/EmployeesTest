Общее описание задания

Написать приложение для iOS. Приложение должно состоять из одного экрана со списком. Список данных в формате JSON приложение загружает из интернета по ссылке, необходимо распарсить эти данные и отобразить их в списке.

Пример возвращаемых данных.

Требование к реализации:

Приложение работает на iOS 13 и выше;
Реализована поддержка iPhone и iPad;
Список отсортирован по алфавиту;
* Кэширование ответа на 1 час;
* Обработаны случаи потери сети / отсутствия соединения.
Внешний вид приложения - по-возможности лаконичный, но, в целом, на усмотрение кандидата.

Требования к коду:

Приложение написано на языке Swift;
Пользовательский интерфейс приложения настроен в InterfaceBuilder (в Storiboard или Xib файлы) или кодом без использования SwiftUI;
Для отображения списка используется UITableView, либо UICollectionView;
Для запроса данных используется URLSession.
Требования к передаче результатов:

Код должен быть выложен в git-репозиторий на github.com или его альтернативах с предоставленным доступом.