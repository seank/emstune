#include "parameterview.h"
#include <QDebug>
ParameterView::ParameterView(QWidget *parent) : QWidget(parent)
{
	ui.setupUi(this);
	connect(ui.parameterTreeWidget,SIGNAL(currentItemChanged(QTreeWidgetItem*,QTreeWidgetItem*)),this,SLOT(currentItemChanged(QTreeWidgetItem*,QTreeWidgetItem*)));
	connect(ui.parameterTreeWidget,SIGNAL(itemSelectionChanged()),this,SLOT(itemSelectionChanged()));
}
void ParameterView::itemSelectionChanged()
{
	return;
	/*qDebug() << "Item selection changed";
	if (ui.parameterTreeWidget->selectedItems().size() <= 0)
	{
		return;
	}
	QTreeWidgetItem *current = ui.parameterTreeWidget->selectedItems()[0];
	qDebug() << "Menu selected:" << current->text(0);
	if (m_metaMenu.dialogmap.contains(current->text(0)))
	{
		qDebug() << "Dialog:" << m_metaMenu.dialogmap[current->text(0)];
	}*/
}

void ParameterView::currentItemChanged(QTreeWidgetItem *current,QTreeWidgetItem *prev)
{
	Q_UNUSED(prev);
	if (!current)
	{
		return;
	}
	/*if (m_metaMenu.menunamemap.contains(current->text(0)))
	{
		if (m_metaMenu.dialogmap.contains(current->text(0)))
		{
			qDebug() << "Dialog:" << m_metaMenu.dialogmap[current->text(0)];
		}
	}*/
	if (current->parent() == 0)
	{
		//It is a top level item. don't do anything
		return;
	}
	for (int i=0;i<m_metaMenu.menulist.size();i++)
	{
		if (m_metaMenu.menulist[i].title == current->parent()->text(0))
		{
			//This is our menu!
			for (int j=0;j<m_metaMenu.menulist[i].subMenuList.size();j++)
			{
				if (m_metaMenu.menulist[i].subMenuList[j].title == current->text(0))
				{
					//This is our current item!
					if (!m_metaMenu.menulist[i].subMenuList[j].is_seperator)
					{
						qDebug() << "Variable:" << m_metaMenu.menulist[i].subMenuList[j].variable;
					}
				}
			}
		}
	}

}

void ParameterView::passMenuList(MenuSetup menu)
{
	m_metaMenu = menu;
	for (int i=0;i<menu.menulist.size();i++)
	{
		//menu.menulist.
		ui.parameterTreeWidget->addTopLevelItem(new QTreeWidgetItem(QStringList() << menu.menulist[i].title));
		QTreeWidgetItem *item = ui.parameterTreeWidget->topLevelItem(ui.parameterTreeWidget->topLevelItemCount()-1);
		for (int j=0;j<menu.menulist[i].subMenuList.size();j++)
		{
			//if (menu.menunamemap.contains(menu.menulist[i].second[j]))
			//{
			//	item->addChild(new QTreeWidgetItem(QStringList() << menu.menunamemap[menu.menulist[i].second[j]]));
			//}
			//else
			//{
			//	item->addChild(new QTreeWidgetItem(QStringList() << menu.menulist[i].second[j]));
			//}
			item->addChild(new QTreeWidgetItem(QStringList() << menu.menulist[i].subMenuList[j].title));
		}
	}
}

void ParameterView::passConfigBlockList(QMap<QString,QList<ConfigBlock> > blocklist)
{
	for (QMap<QString,QList<ConfigBlock> >::const_iterator i=blocklist.constBegin();i!=blocklist.constEnd();i++)
	{
		ui.parameterTreeWidget->addTopLevelItem(new QTreeWidgetItem(QStringList() << i.key()));
		QTreeWidgetItem *item = ui.parameterTreeWidget->topLevelItem(ui.parameterTreeWidget->topLevelItemCount()-1);
		for (int j=0;j<i.value().size();j++)
		{
			item->addChild(new QTreeWidgetItem(QStringList() << i.value().at(j).name()));
		}
	}
}
