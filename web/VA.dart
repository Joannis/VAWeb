import 'package:uuid/uuid.dart';
import 'package:xml/xml.dart';

XmlBuilder builder = new XmlBuilder();

class Action
{
  void generateXML()
  {
    /*builder.element("CommandAction", nest: ()
    {

    });*/
  }
}

class Command
{
  String id;
  String commandString, category;
  bool asyncr, enabled, useShortcut, keyPassthrough, useSpokenPhrase, onlyKeyUp, useConfidence, useJoystick, useProcessOverride, joystickUp, keepRepeating;
  int keyCode, confidence, repeatNumber, repeatType, commandType, minimumConfidenceLevel, prefixActionCount;
  int shift, alt, ctrl, win; // 0 for none, 1 for left, 2 for right
  int joystickButton, joystickNumber, joystickButton2, joystickNumber2;
  List<Action> actionSequence;
  String sourceProfile;

  Command(this.id, this.commandString, this.actionSequence, {
  this.category: "", this.asyncr: true, this.enabled: true,
  this.useShortcut: false, this.keyCode: 0, this.shift: 0, this.alt: 0, this.ctrl: 0, this.win: 0, this.keyPassthrough: true, this.onlyKeyUp: false,
  this.useJoystick: false, this.joystickNumber: 0, this.joystickButton: -1, this.joystickNumber2: 0, this.joystickButton2: -1, this.joystickUp: false,
  this.useSpokenPhrase: true, this.repeatNumber: 2, this.repeatType: 0, this.commandType: 0, this.sourceProfile: "00000000-0000-0000-0000-000000000000",
  this.useConfidence: false, this.minimumConfidenceLevel: 0, this.confidence: 0, this.keepRepeating: false, this.prefixActionCount: 0, this.useProcessOverride: false
  });

  void generateXML()
  {
    builder.element("Command", nest: ()
    {
      builder.element("Id", nest: ()
      {
        builder.text(id);
      });

      builder.element("CommandString", nest:()
      {
        builder.text(this.commandString);
      });

      builder.element("ActionSequence", nest:()
      {
        actionSequence.forEach((Action a) => a.generateXML());
      });

      builder.element("Async", nest:() => builder.text(boolText(asyncr)));
      builder.element("Enabled", nest:() => builder.text(boolText(enabled)));
      builder.element("Category", nest:() => builder.text(category));
      builder.element("UseShortcut", nest:() => builder.text(boolText(useShortcut)));
      builder.element("keyValue", nest:() => builder.text(keyCode));

      builder.element("keyShift", nest:()
      {
        if(shift == 0) builder.text("0");
        if(shift == 160) builder.text("160");
        if(shift == 161) builder.text("161");
      });
      builder.element("keyAlt", nest:()
      {
        if(alt == 0) builder.text("0");
        if(shift == 164) builder.text("164");
        if(shift == 165) builder.text("165");
      });
      builder.element("keyCtrl", nest:()
      {
        if(ctrl == 0) builder.text("0");
        if(shift == 162) builder.text("162");
        if(shift == 163) builder.text("163");
      });
      builder.element("keyWin", nest:()
      {
        if(win == 0) builder.text("0");
        if(shift == 91) builder.text("91");
        if(shift == 92) builder.text("92");
      });

      builder.element("keyPassthru", nest:() => builder.text(boolText(keyPassthrough)));
      builder.element("RepeatNumber", nest:() => builder.text(repeatNumber));
      builder.element("RepeatType", nest:() => builder.text(repeatType));
      builder.element("CommandType", nest:() => builder.text(commandType));
      builder.element("SourceProfile", nest:() => builder.text(sourceProfile));
      builder.element("UseConfidence", nest:() => builder.text(boolText(useConfidence)));
      builder.element("minimumConfidenceLevel", nest:() => builder.text(minimumConfidenceLevel));
      builder.element("UseJoystick", nest:() => builder.text(boolText(useJoystick)));
      builder.element("joystickNumber", nest:() => builder.text(joystickNumber));
      builder.element("joystickButton", nest:() => builder.text(joystickButton));
      builder.element("joystickNumber2", nest:() => builder.text(joystickNumber2));
      builder.element("joystickButton2", nest:() => builder.text(joystickButton2));
      builder.element("joystickUp", nest:() => builder.text(boolText(joystickUp)));
      builder.element("KeepRepeating", nest:() => builder.text(boolText(keepRepeating)));
      builder.element("UseProcessOverride", nest:() => builder.text(boolText(useProcessOverride)));
      builder.element("Referrer", nest: () => builder.attribute("xsi:nil", "true"));
      builder.element("Confidence", nest:() => builder.text(confidence));
      builder.element("PrefixActionCount", nest:() => builder.text(prefixActionCount));
    });
  }
}

class Profile
{
  List<Command> commands = [];

  String name;
  bool overrideGlobal, globalHotkeyEnabled, globalHotkeyPassthrough, overrideMouse, overrideStop, stopCommandHotkeyEnabled,
  stopCommandHotkeyPassthrough, disableShortcuts, useOverrideListening, overrideJoystickGlobal, overrideConfidence,
  catchAllEnabled, initializeCommandEnabled, useProcessOverride;
  int globalHotkeyIndex, globalHotkeyValue, globalHotkeyShift, globalHotkeyAlt, globalHotkeyCtrl, globalHotkeyWin, mouseIndex,
  stopCommandHotkeyValue, stopCommandHotkeyShift, stopCommandHotkeyAlt, stopCommandHotkeyCtrl, stopCommandHotkeyWin,
  globalJoystickIndex, globalJoystickButton, globalJoystickNumber, globalJoystickButton2, globalJoystickNumber2,
  confidence;

  String overrideListeningCommand;
  String exportVAversion = "1.5.7";
  String exportOSversionMajor = "6";
  String exportOSversionMinor = "2";

  Profile(this.name, {this.overrideGlobal: false, this.globalHotkeyIndex: 0, this.globalHotkeyEnabled: false,
  this.globalHotkeyValue: 0, this.globalHotkeyShift: 0, this.globalHotkeyAlt: 0,
  this.globalHotkeyCtrl: 0, this.globalHotkeyWin: 0, this.globalHotkeyPassthrough: false, this.overrideMouse: false,
  this.mouseIndex: 0, this.overrideStop: false, this.stopCommandHotkeyEnabled: false,
  this.stopCommandHotkeyValue: 0, this.stopCommandHotkeyShift: 0, this.stopCommandHotkeyAlt: 0,
  this.stopCommandHotkeyCtrl: 0, this.stopCommandHotkeyWin: 0, this.stopCommandHotkeyPassthrough: false,
  this.disableShortcuts: false, this.useOverrideListening: true, this.overrideListeningCommand: "", this.overrideJoystickGlobal: false,
  this.globalJoystickIndex: 0, this.globalJoystickButton: 0, this.globalJoystickNumber: 0, this.globalJoystickButton2: 0,
  this.globalJoystickNumber2: 0, this.overrideConfidence: false, this.confidence: 0, this.catchAllEnabled: false,
  this.initializeCommandEnabled: false, this.useProcessOverride: false});

  void generateXML()
  {
    builder.element("Profile", nest: ()
    {
      builder.attribute("xmlns:xsd", "http://www.w3.org/2001/XMLSchema");
      builder.attribute("xmlns:xsi", "http://www.w3.org/2001/XMLSchema-instance");

      builder.element("Id", nest: ()
      {
        builder.text(new Uuid().v4());
      });

      builder.element("Name", nest: ()
      {
        builder.text(name);
      });

      builder.element("Commands", nest: ()
      {
        commands.forEach((Command c) => c.generateXML());
      });

      builder.element("OverrideGlobal", nest: () => builder.text(boolText(overrideGlobal)));
      builder.element("GlobalHotkeyIndex", nest: () => builder.text(globalHotkeyIndex));
      builder.element("GlobalHotkeyEnabled", nest: () => builder.text(boolText(globalHotkeyEnabled)));
      builder.element("GlobalHotkeyValue", nest: () => builder.text(globalHotkeyValue));
      builder.element("GlobalHotkeyShift", nest: () => builder.text(globalHotkeyShift));
      builder.element("GlobalHotkeyAlt", nest: () => builder.text(globalHotkeyAlt));
      builder.element("GlobalHotkeyCtrl", nest: () => builder.text(globalHotkeyCtrl));
      builder.element("GlobalHotkeyWin", nest: () => builder.text(globalHotkeyWin));
      builder.element("GlobalHotkeyPassThru", nest: () => builder.text(boolText(globalHotkeyPassthrough)));
      builder.element("MouseIndex", nest: () => builder.text(mouseIndex));
      builder.element("OverrideStop", nest: () => builder.text(boolText(overrideStop)));
      builder.element("StopCommandHotkeyEnabled", nest: () => builder.text(boolText(stopCommandHotkeyEnabled)));
      builder.element("StopCommandHotkeyValue", nest: () => builder.text(stopCommandHotkeyValue));
      builder.element("StopCommandHotkeyShift", nest: () => builder.text(stopCommandHotkeyShift));
      builder.element("StopCommandHotkeyAlt", nest: () => builder.text(stopCommandHotkeyAlt));
      builder.element("StopCommandHotkeyCtrl", nest: () => builder.text(stopCommandHotkeyCtrl));
      builder.element("StopCommandHotkeyWin", nest: () => builder.text(stopCommandHotkeyWin));
      builder.element("StopCommandHotkeyPassThru", nest: () => builder.text(boolText(stopCommandHotkeyPassthrough)));
      builder.element("DisableShortcuts", nest: () => builder.text(boolText(disableShortcuts)));
      builder.element("UseOverrideListening", nest: () => builder.text(boolText(useOverrideListening)));
      builder.element("OverrideListeningCommand", nest: () => builder.text(overrideListeningCommand));
      builder.element("OverrideJoystickGlobal", nest: () => builder.text(boolText(overrideJoystickGlobal)));
      builder.element("GlobalJoystickIndex", nest: () => builder.text(globalJoystickIndex));
      builder.element("GlobalJoystickButton", nest: () => builder.text(globalJoystickButton));
      builder.element("GlobalJoystickNumber", nest: () => builder.text(globalJoystickNumber));
      builder.element("GlobalJoystickButton2", nest: () => builder.text(globalJoystickButton2));
      builder.element("GlobalJoystickNumber2", nest: () => builder.text(globalJoystickNumber2));
      builder.element("ReferencedProfile", nest: () => builder.attribute("xsi:nil", "true"));
      builder.element("ExportVAVersion", nest: () => builder.text(exportVAversion));
      builder.element("ExportOSVersionMajor", nest: () => builder.text(exportOSversionMajor));
      builder.element("ExportOSVersionMinor", nest: () => builder.text(exportOSversionMinor));
      builder.element("OverrideConfidence", nest: () => builder.text(boolText(overrideConfidence)));
      builder.element("Confidence", nest: () => builder.text(confidence));
      builder.element("CatchAllEnabled", nest: () => builder.text(boolText(catchAllEnabled)));
      builder.element("CatchAllEnabled", nest: () => builder.text(boolText(catchAllEnabled)));
      builder.element("CatchAllId", nest: () => builder.attribute("xsi:nil", "true"));
      builder.element("InitializecommandEnabled", nest: () => builder.text(initializeCommandEnabled));
      builder.element("InitializecommandId", nest: () => builder.attribute("xsi:nil", "true"));
      builder.element("UseProcessOverride", nest: () => builder.text(boolText(useProcessOverride)));
    });
  }
}

List<Command> commands = new List<Command>();

main(List<String> args) async
{
  Profile p = new Profile("Test");
  p = await add(p, [["computer", "koekjes"], ["deploy", "retract"], ["fuel scoop", "cargo hatch", "cargo", "landing gear"]]);

  generateXML(p);
}

add(Profile p, List<List<String>> commandLists) async
{
  String commandString = generateCommandString(commandLists);

  print(commandString);

  p.commands.add(new Command(new Uuid().v4(), commandString, []));

  return p;
}

String generateCommandString(List<List<String>> commands)
{
  String total = "";

  commands.first.forEach((String s)
  {
    List<String> commandStrings = _addCommandString(s, commands.sublist(1));

    commandStrings.forEach((String s2)
    {
      total += "$s $s2";
    });
  });

  return total;
}

List<String> _addCommandString(String base, List<List<String>> commands)
{
  List<String> total = [];

  if(commands.isEmpty)
    return ["; "];

  commands.first.forEach((String s)
  {
    if(commands.length > 0) {
      List<String> commandStrings = _addCommandString("$base $s", commands.sublist(1));

      commandStrings.forEach((String s2)
      {
        total.add("$s $s2");
      });
    }
  });

  return total;
}

generateXML(Profile p)
{
  builder.processing('xml', 'version="1.0" encoding="utf-8"');

  p.generateXML();

  String data = builder.build().toXmlString(pretty: true);

  print(data);
}

boolText(bool boolean) => boolean ? "true" : "false";
intBool(bool boolean) => boolean ? "1" : "0";