#ifndef PARAMETERVIEW_H
#define PARAMETERVIEW_H

#include <QWidget>
#include "headers.h"
#include "ui_parameterview.h"
#include "configblock.h"

class ParameterView : public QWidget
{
	Q_OBJECT
public:
	explicit ParameterView(QWidget *parent = 0);
	void passMenuList(MenuSetup menu);
	void passConfigBlockList(QMap<QString,QList<ConfigBlock> > blocklist);

private:
	MenuSetup m_metaMenu;
	Ui::Form ui;
signals:

public slots:
	void currentItemChanged(QTreeWidgetItem *current,QTreeWidgetItem *prev);
	void itemSelectionChanged();
};

#endif // PARAMETERVIEW_H
