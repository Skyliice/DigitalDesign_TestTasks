using System.Diagnostics;
using System.Text;
using System.Text.RegularExpressions;

Console.Write("Введите путь к текстовому файлу (прим: C:\\Users\\Skylice\\Desktop\\voina.fb2): ");
var path = Console.ReadLine();
var text = string.Empty;
try
{
    if (File.Exists(path))
    {
        text = File.ReadAllText(path,Encoding.UTF8);
        text = Regex.Replace(text, "<[^>]+>", string.Empty);
        text = Regex.Replace(text,"[^a-zA-Zа-яА-я'\\s]",string.Empty);
        text = Regex.Replace(text, "[\n\t\r]", string.Empty);
        Console.WriteLine("Файл найден!\nИдет подсчёт слов...");
        var words = text
            .Split(new [] {",",";"," "},StringSplitOptions.RemoveEmptyEntries)
            .GroupBy(o => o.ToLower())
            .OrderByDescending(o=>o.Count());
        var finalstr = string.Empty;
        foreach (var word in words)
        {
            finalstr += word.Key + $"\t{word.Count()}\n";
        }

        var curDir = new DirectoryInfo(Directory.GetCurrentDirectory());
        var finPath = curDir.FullName.Replace(curDir.Name,string.Empty) + $"{Path.GetFileName(path)
            .Split(new [] {".txt",".fb2",".docx",".doc",".rtf"},StringSplitOptions.RemoveEmptyEntries)[0]}_words.txt";
        File.WriteAllText(finPath,finalstr);
        Console.WriteLine($"Готово!\nМесторасположение созданного файла: {finPath}");
        Process.Start("explorer.exe", finPath);
    }
    else
    {
        Console.WriteLine("Такого файла не существует!");
    }
}
catch
{
    Console.WriteLine("Произошла какая-то ошибка!");
}
Console.ReadLine();